import Foundation

// ======================================================
// BANK PAYMENT
// ======================================================

class BankPayment: Payment {

    let accountNumber: String


    // --------------------------------------------------
    // INITIALIZER
    // --------------------------------------------------

    init(
        amount: Double,
        currency: String,
        accountNumber: String
    ) {

        self.accountNumber = accountNumber

        // Initialize properties inherited from Payment.

        super.init(
            amount: amount,
            currency: currency
        )
    }


    // --------------------------------------------------
    // OVERRIDE process()
    // --------------------------------------------------

    override func process() {

        print(
            "Connecting to bank..."
        )

        print(
            "Account: \(accountNumber)"
        )

        print(
            "Processing bank payment..."
        )

        print(
            "Bank payment successful!"
        )
    }


    // --------------------------------------------------
    // OVERRIDE showDetails()
    // --------------------------------------------------

    override func showDetails() {

        print("----- Bank Payment -----")

        print("Amount: \(amount) \(currency)")

        print("Account: \(accountNumber)")

        print("Status: \(status)")
    }
}
