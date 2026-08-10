import Foundation

// ======================================================
// PAYMENT BASE CLASS
// ======================================================
//
// This class represents a generic payment.
//
// Other payment types can inherit from this class.
//
// Example:
//
// MobileMoneyPayment
// BankPayment
// CardPayment
//
// can all inherit from Payment.

// "final" is NOT used here because we want other
// classes to inherit from Payment.

class Payment {

    // --------------------------------------------------
    // STATIC PROPERTY
    // --------------------------------------------------
    //
    // Belongs to the Payment class itself.
    // It is shared by all payment objects.

    static var totalPayments = 0


    // --------------------------------------------------
    // PROPERTIES
    // --------------------------------------------------

    let amount: Double

    let currency: String

    // private(set) means:
    //
    // Other code can READ status,
    // but only Payment can CHANGE it.

    private(set) var status: String = "Pending"


    // --------------------------------------------------
    // INITIALIZER
    // --------------------------------------------------

    init(amount: Double, currency: String) {

        self.amount = amount
        self.currency = currency

        Payment.totalPayments += 1

        print("Payment created")
    }


    // --------------------------------------------------
    // METHOD
    // --------------------------------------------------

    func process() {

        status = "Processed"

        print(
            "Processing payment of \(amount) \(currency)"
        )
    }


    // --------------------------------------------------
    // METHOD THAT CAN BE OVERRIDDEN
    // --------------------------------------------------

    func showDetails() {

        print(
            "Payment: \(amount) \(currency)"
        )
    }


    // --------------------------------------------------
    // DEINITIALIZER
    // --------------------------------------------------

    deinit {

        print(
            "Payment object removed from memory"
        )
    }
}
