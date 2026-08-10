import Foundation

// ======================================================
// SWIFT ACCESS CONTROL
// ======================================================
//
// Access levels control WHO can see or modify your code.
//
// From MOST restrictive to LEAST restrictive:
//
// private
// fileprivate
// internal
// public
// open
//
// Note:
// internal is the default in Swift.
//
// private(set) is different:
// it controls WRITE access to a property.



// ======================================================
// 1. private
// ======================================================
//
// Accessible only inside the enclosing declaration
// (such as the struct/class and its extensions).

struct BankAccount {

    private var balance: Double = 0

    mutating func deposit(_ amount: Double) {
        balance += amount
    }

    func showBalance() {
        print("Balance: \(balance)")
    }
}

var account = BankAccount()

account.deposit(500)
account.showBalance()

// NOT allowed:
//
// account.balance = 10000
//
// Because balance is private.



// ======================================================
// 2. private(set)
// ======================================================
//
// The property can be READ from outside,
// but it can only be MODIFIED from inside the struct.
//
// This is extremely useful for protecting state.

struct User {

    let name: String

    private(set) var loginCount = 0

    mutating func login() {
        loginCount += 1
    }
}

var user = User(name: "Noel")

// Reading is allowed:
print(user.loginCount)

// Modifying directly is NOT allowed:
//
// user.loginCount = 100
//
// But the struct itself can modify it:
user.login()

print(user.loginCount) // 1



// ======================================================
// 3. fileprivate
// ======================================================
//
// Accessible anywhere inside the SAME Swift file.
//
// Other files cannot access it.

struct FileManagerExample {

    fileprivate var fileName = "data.txt"

    func printFileName() {
        print(fileName)
    }
}

let file = FileManagerExample()

print(file.fileName)

// This works because we are still in the
// same Swift file.



// ======================================================
// 4. internal
// ======================================================
//
// This is the DEFAULT access level.
//
// Accessible anywhere inside the SAME MODULE.
//
// You normally don't need to write "internal"
// because Swift uses it automatically.

struct Product {

    internal let name: String
    let price: Double
}

let product = Product(
    name: "MacBook",
    price: 480000
)

print(product.name)
print(product.price)



// This is equivalent to:
//
// struct Product {
//
//     let name: String
//     let price: Double
//
// }
//
// because internal is the default.



// ======================================================
// 5. public
// ======================================================
//
// Accessible from outside the module.
//
// However, public does NOT allow subclassing or
// overriding in the same way that open does.
//
// You'll mostly encounter public when creating
// reusable libraries/frameworks.

public struct APIClient {

    public let baseURL: String

    public init(baseURL: String) {
        self.baseURL = baseURL
    }

    public func connect() {
        print("Connecting to \(baseURL)")
    }
}

let client = APIClient(
    baseURL: "https://api.example.com"
)

client.connect()



// ======================================================
// 6. open
// ======================================================
//
// open is mainly relevant to CLASSES.
//
// It is the most permissive access level.
//
// An open class can be:
//   - accessed from another module
//   - subclassed from another module
//
// An open method can also be overridden outside
// the module.

open class Animal {

    open func makeSound() {
        print("Animal sound")
    }
}


// A subclass could override makeSound:
//
// class Dog: Animal {
//
//     override func makeSound() {
//         print("Woof!")
//     }
// }



// ======================================================
// 7. COMPARING THEM
// ======================================================
//
// private
//   ↓
// Only the enclosing type/declaration.
//
// fileprivate
//   ↓
// Anywhere in the same Swift file.
//
// internal
//   ↓
// Anywhere in the same module.
// DEFAULT.
//
// public
//   ↓
// Accessible from other modules.
//
// open
//   ↓
// Accessible from other modules AND
// designed to allow subclassing/overriding.
//
//
//
// private(set)
//   ↓
// Special case:
// Read from outside,
// write only from inside.



// ======================================================
// PRACTICAL EXAMPLE
// ======================================================
//
// Imagine a BankAccount in a real application.

struct SecureBankAccount {

    // Nobody outside this struct can directly
    // modify or even read the balance.
    private var balance: Double = 0

    // Everyone can see the account owner.
    let owner: String

    // Everyone can read the number of transactions,
    // but only the struct can modify it.
    private(set) var transactionCount = 0


    // Public method that controls how money is deposited.
    mutating func deposit(amount: Double) {

        guard amount > 0 else {
            return
        }

        balance += amount
        transactionCount += 1
    }


    // Public method for safely checking the balance.
    func getBalance() -> Double {
        return balance
    }
}

var bankAccount = SecureBankAccount(
    owner: "Noel"
)

bankAccount.deposit(amount: 500)

print(bankAccount.owner)
print(bankAccount.getBalance())
print(bankAccount.transactionCount)

// NOT allowed:
//
// bankAccount.balance = 100000
// bankAccount.transactionCount = 100
//
// The struct controls how these values change.
