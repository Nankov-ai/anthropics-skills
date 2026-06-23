---
name: pt-checkout-builder
description: >
  Design and implement checkout and payment flows for Portuguese digital products.
  Use when the user wants to build a checkout page, payment flow, or purchase funnel
  for a SaaS, digital product, course, portal, or subscription sold in Portugal or
  the EU. Covers multi-step checkout UX (Identificação → Opções → Pagamento),
  required Portuguese billing fields (NIF, morada, código postal), IVA 23%
  calculation, discount coupons, and integration with Portuguese and international
  payment platforms: SalesPark, Stripe, EasyPay, SIBS/MB Way, PayPal.
  Also triggers when the user asks about: integrating SalesPark, setting up Stripe
  for Portugal, MB Way payments, webhook handling for payment confirmation,
  checkout UX patterns, or billing/invoicing for digital products in PT.
---

# PT Checkout Builder

## Overview
Design and implement complete checkout flows for Portuguese digital products.
Covers UX structure, required fields, IVA handling, platform integration, and
post-payment flows.

## When to trigger
- User wants to build a checkout or payment page for a PT digital product
- User asks about integrating SalesPark, Stripe, EasyPay, or MB Way
- User needs help with IVA calculation, NIF validation, or billing fields for PT
- User wants to design a multi-step purchase funnel

---

## 1. Checkout UX Structure

### Recommended multi-step flow (pattern from PT market)
```
Step 1: Identificação      → Step 2: Opções        → Step 3: Pagamento
  Nome                          Plano/pack               Método de pagamento
  Email                         Add-ons                  Cartão / MB Way / Ref MB
  Telemóvel                     Cupão de desconto         Confirmar
  Dados de faturação
```

### Single-page alternative (lower friction, lower AOV)
All fields on one page. Better for low-price products (< €20). Higher conversion
for impulse purchases; lower for high-ticket where trust matters.

---

## 2. Required Fields for Portugal

### Identificação
| Field | Required | Notes |
|-------|----------|-------|
| Nome completo | Yes | |
| Email | Yes | Used for receipt and account creation |
| Telemóvel | Optional | Required if sending SMS confirmations or MB Way |

### Dados de Faturação (for legal invoicing in PT)
| Field | Required | Notes |
|-------|----------|-------|
| NIF (Número de Contribuinte) | Yes for B2B; optional B2C | 9 digits, validate checksum |
| Nome / Empresa para Fatura | Yes | |
| Email para Fatura | Yes | May differ from account email |
| Morada | Yes | |
| Cidade | Yes | |
| Código Postal | Yes | Format: XXXX-XXX |
| País | Yes | Default: Portugal |

### NIF Validation (PT checksum algorithm)
```javascript
function validateNIF(nif) {
  if (!/^\d{9}$/.test(nif)) return false;
  const digits = nif.split('').map(Number);
  const firstDigit = digits[0];
  // Valid first digits: 1,2 (pessoas), 5 (empresas), 6 (Estado), 7,8,9 (outros)
  if (![1,2,3,5,6,7,8,9].includes(firstDigit)) return false;
  let sum = 0;
  for (let i = 0; i < 8; i++) sum += digits[i] * (9 - i);
  const remainder = sum % 11;
  const checkDigit = remainder < 2 ? 0 : 11 - remainder;
  return checkDigit === digits[8];
}
```

---

## 3. Pricing & IVA

### IVA rates in Portugal (2026)
| Rate | % | Applies to |
|------|---|-----------|
| Normal | 23% | Most digital services, SaaS, software |
| Intermédio | 13% | Some food, accommodation |
| Reduzido | 6% | Books (physical), some medical |

**Digital products and SaaS: always 23% IVA.**

### Price display pattern
```
Preço s/IVA:    6.50€
IVA 23%:        1.50€
─────────────────────
Total a pagar:  8.00€
```

### Coupon / Desconto logic
- Apply before IVA calculation (discount on net price)
- Show original price struck through + discounted price
- Validate server-side — never trust client-side coupon calculations

---

## 4. Payment Platforms

### SalesPark
Portuguese platform for digital creators (courses, ebooks, subscriptions, credits).
- **Best for**: digital products sold to PT consumers, simple setup, no-code checkout
- **Supports**: Cartão de crédito/débito, MB Way, Referência MB, PayPal
- **Integration**: No-code embed or hosted checkout via link
- **Webhooks**: `checkout.salespark.io` sends POST on purchase completion
- **Fees**: % per transaction (check current pricing at salespark.io)
- **Invoicing**: Automatic invoice generation with NIF support

```javascript
// SalesPark webhook payload (simplified)
{
  "event": "purchase.completed",
  "order_id": "ORD_123",
  "customer": { "name": "...", "email": "...", "nif": "..." },
  "product": { "id": "...", "name": "100 Créditos IA", "price": 8.00 },
  "payment_method": "mbway"
}
```

### Stripe (Portugal)
- **Best for**: SaaS subscriptions, international sales, developer control
- **Supports**: Cards, MB Way (via Stripe), SEPA Direct Debit
- **Setup**: Enable PT as a country, set currency to EUR, configure tax (IVA 23%)
- **Tax**: Use Stripe Tax for automatic IVA calculation and reporting

```javascript
// Stripe — create payment intent with IVA
const paymentIntent = await stripe.paymentIntents.create({
  amount: 800, // cents
  currency: 'eur',
  automatic_tax: { enabled: true },
  metadata: { nif: customer.nif }
});
```

```javascript
// Stripe — MB Way payment method
const paymentIntent = await stripe.paymentIntents.create({
  amount: 800,
  currency: 'eur',
  payment_method_types: ['mb_way'],
  payment_method_data: {
    type: 'mb_way',
    mb_way: { phone: '+351912345678' }
  }
});
```

### EasyPay
- **Best for**: PT-native integrations, Referência MB, MB Way, subscription billing
- **Supports**: Referência MB, MB Way, Cartão, Direct Debit
- **Unique**: Referência MB is widely used in PT — generates ATM payment reference
- **Docs**: developers.easypay.pt

```javascript
// EasyPay — generate Referência MB
const response = await fetch('https://api.prod.easypay.pt/2.0/single', {
  method: 'POST',
  headers: {
    'AccountId': EASYPAY_ACCOUNT_ID,
    'ApiKey': EASYPAY_API_KEY,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    type: 'sale',
    payment: { methods: ['mb'], type: 'sale', capture: { descriptive: 'Créditos IA' } },
    value: 8.00,
    customer: { email: customer.email, name: customer.name }
  })
});
// Response includes: entity, reference, expiry_date for ATM payment
```

### MB Way (via EasyPay or Stripe)
MB Way requires the customer's PT phone number (+351XXXXXXXXX).
- Customer approves payment in MB Way app within ~4 minutes
- Webhook confirms payment asynchronously
- Always show "Aguarda confirmação no teu telemóvel" after submission

---

## 5. Webhook & Post-Payment Flow

### Webhook handling pattern
```javascript
// Express.js example
app.post('/webhooks/payment', express.raw({ type: 'application/json' }), async (req, res) => {
  // 1. Verify signature (platform-specific)
  // 2. Parse event
  const event = JSON.parse(req.body);

  if (event.event === 'purchase.completed') {
    await db.createOrder(event);           // Save order
    await credits.add(event.customer, 100); // Grant credits/access
    await email.sendConfirmation(event);    // Send receipt
    await invoice.generate(event);          // Generate invoice with NIF
  }

  res.status(200).send('ok'); // Always respond 200 quickly
});
```

### Post-payment confirmation page
Show immediately after successful payment:
1. ✅ Pagamento confirmado
2. Resumo da compra (produto, valor, referência)
3. "Enviámos o recibo para [email]"
4. CTA → access the product

---

## 6. Common PT Checkout Mistakes

| Mistake | Fix |
|---------|-----|
| Not validating NIF before submission | Use checksum validation client-side + server-side |
| Showing price with IVA only | Always show price breakdown (s/IVA + IVA + total) |
| Not supporting Referência MB | Many PT users prefer ATM payment — add EasyPay |
| Forgetting MB Way timeout (4 min) | Show countdown + retry option |
| Applying coupon after IVA | Coupon always applies to net price, then recalculate IVA |
| No invoice with NIF | Legal requirement for B2B; best practice for B2C in PT |

---

## 7. Output Format

When the user asks to build a checkout, produce:
1. **UX flow** — step-by-step with fields per step
2. **Platform recommendation** — which platform fits their use case and why
3. **Code snippets** — relevant integration code (frontend form + backend webhook)
4. **IVA calculation** — price breakdown table
5. **Checklist** — pre-launch checklist for PT compliance

### Pre-launch checklist
- [ ] NIF validation implemented (client + server)
- [ ] IVA 23% correctly calculated and displayed
- [ ] Invoice generation with NIF support
- [ ] MB Way and/or Referência MB available
- [ ] Webhook handles payment confirmation reliably (idempotent)
- [ ] Confirmation email sent after payment
- [ ] Refund policy stated before payment step
- [ ] RGPD consent for storing billing data
- [ ] Test with PT test cards and MB Way sandbox
