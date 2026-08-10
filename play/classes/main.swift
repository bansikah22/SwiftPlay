// 10/08/2026 Noel Bansikah

import Foundation

// ======================================================
// CREATE MOBILE MONEY PAYMENT
// ======================================================

let mobileMoney = MobileMoneyPayment(
    amount: 5000,
    currency: "FCFA",
    phoneNumber: "677123456"
)


// Call overridden method.

mobileMoney.process()

mobileMoney.showDetails()


print("\n")


// ======================================================
// CREATE BANK PAYMENT
// ======================================================

let bankPayment = BankPayment(
    amount: 25000,
    currency: "FCFA",
    accountNumber: "123456789"
)

bankPayment.process()

bankPayment.showDetails()


print("\n")


// ======================================================
// STATIC PROPERTY
// ======================================================
//
// totalPayments belongs to Payment,
// not to an individual payment.

print(
    "Total payments: \(Payment.totalPayments)"
)


// ======================================================
// POLYMORPHISM
// ======================================================
//
// A parent class reference can point to
// different child objects.

let payment1: Payment = MobileMoneyPayment(
    amount: 10000,
    currency: "FCFA",
    phoneNumber: "690123456"
)

let payment2: Payment = BankPayment(
    amount: 50000,
    currency: "FCFA",
    accountNumber: "987654321"
)


// Both variables are typed as Payment.
//
// But Swift calls the appropriate overridden
// implementation at runtime.

payment1.process()

payment2.process()


// ======================================================
// ARRAY OF DIFFERENT PAYMENT TYPES
// ======================================================
//
// Because both classes inherit from Payment,
// they can exist in the same array.

let payments: [Payment] = [

    MobileMoneyPayment(
        amount: 5000,
        currency: "FCFA",
        phoneNumber: "677111222"
    ),

    BankPayment(
        amount: 15000,
        currency: "FCFA",
        accountNumber: "123456789"
    ),

    MobileMoneyPayment(
        amount: 3000,
        currency: "FCFA",
        phoneNumber: "699333444"
    )
]


// Each object gets its own implementation
// of showDetails().

for payment in payments {

    payment.showDetails()

    print("---")
}
