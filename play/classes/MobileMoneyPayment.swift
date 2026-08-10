import Foundation

// ======================================================
// MOBILE MONEY PAYMENT
// ======================================================
//
// MobileMoneyPayment inherits everything from Payment.
//
// This is called INHERITANCE.
//
// MobileMoneyPayment
//          ↓
//       Payment

class MobileMoneyPayment: Payment {

    // Additional property specific to Mobile Money.

    let phoneNumber: String


    // --------------------------------------------------
    // INITIALIZER
    // --------------------------------------------------

    init(
        amount: Double,
        currency: String,
        phoneNumber: String
    ) {

        self.phoneNumber = phoneNumber

        // Call the parent's initializer.
        //
        // super = parent class

        super.init(
            amount: amount,
            currency: currency
        )
    }


    // --------------------------------------------------
    // METHOD OVERRIDING
    // --------------------------------------------------
    //
    // Payment already has:
    //
    // func process()
    //
    // We are changing the behavior specifically
    // for MobileMoneyPayment.

    override func process() {

        status = "Processing"

        print(
            "Processing Mobile Money payment..."
        )

        print(
            "Phone: \(phoneNumber)"
        )

        status = "Processed"

        print(
            "Mobile Money payment successful!"
        )
    }


    // --------------------------------------------------
    // OVERRIDING showDetails()
    // --------------------------------------------------

    override func showDetails() {

        print("----- Mobile Money Payment -----")

        print("Amount: \(amount) \(currency)")

        print("Phone: \(phoneNumber)")

        print("Status: \(status)")
    }
}
