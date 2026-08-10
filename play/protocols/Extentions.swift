import Foundation

// ======================================================
// SWIFT EXTENSIONS - COMPLETE NOTES
// ======================================================
//
// An extension allows you to add functionality to an
// existing type without changing its original definition.
//
// You can use extensions with:
//
// - Structs
// - Classes
// - Enums
// - Protocols
// - Swift's built-in types
//
// Example:
//
// extension String {
//     ...
// }
//
// This adds functionality to String itself.



// ======================================================
// 1. BASIC EXTENSION
// ======================================================

struct Person {

    let name: String
    let age: Int
}


// Later, we can extend Person.

extension Person {

    func introduce() {

        print(
            "My name is \(name) and I am \(age) years old."
        )
    }
}


let person = Person(
    name: "Noel",
    age: 25
)

person.introduce()



// ======================================================
// 2. EXTENSIONS CAN ADD COMPUTED PROPERTIES
// ======================================================
//
// Extensions can add computed properties.
//
// They cannot add stored properties.
//
// This is an important limitation.

extension Person {

    var isAdult: Bool {

        return age >= 18
    }
}


print(person.isAdult)



// ======================================================
// 3. EXTENDING BUILT-IN TYPES
// ======================================================
//
// You can extend types provided by Swift.
//
// For example, String.

extension String {

    var wordCount: Int {

        return self
            .split(separator: " ")
            .count
    }
}


let message = "Swift is really powerful"

print(message.wordCount)

// Output:
//
// 4



// ======================================================
// 4. ADDING METHODS TO BUILT-IN TYPES
// ======================================================

extension String {

    func shout() -> String {

        return self.uppercased() + "!"
    }
}


let text = "hello swift"

print(text.shout())

// Output:
//
// HELLO SWIFT!



// ======================================================
// 5. EXTENDING INT
// ======================================================

extension Int {

    var isEven: Bool {

        return self % 2 == 0
    }

    var isOdd: Bool {

        return self % 2 != 0
    }
}


let number = 10

print(number.isEven) // true
print(number.isOdd)  // false



// ======================================================
// 6. EXTENSIONS CAN ADD INITIALIZERS
// ======================================================
//
// Extensions can add new initializers.
//
// Example:

struct User {

    let name: String
    let age: Int
}


extension User {

    init(name: String) {

        self.name = name
        self.age = 0
    }
}


let user = User(
    name: "Noel"
)

print(user.name)
print(user.age)



// ======================================================
// 7. EXTENSIONS WITH ENUMS
// ======================================================

enum PaymentStatus {

    case pending
    case completed
    case failed
}


extension PaymentStatus {

    var description: String {

        switch self {

        case .pending:
            return "Payment is pending"

        case .completed:
            return "Payment completed"

        case .failed:
            return "Payment failed"
        }
    }
}


let status = PaymentStatus.completed

print(status.description)



// ======================================================
// 8. EXTENSIONS WITH STATIC METHODS
// ======================================================

struct Calculator {

    static func add(
        _ a: Int,
        _ b: Int
    ) -> Int {

        return a + b
    }
}


// We can add more functionality later.

extension Calculator {

    static func multiply(
        _ a: Int,
        _ b: Int
    ) -> Int {

        return a * b
    }
}


print(
    Calculator.add(5, 10)
)

print(
    Calculator.multiply(5, 10)
)



// ======================================================
// 9. EXTENSIONS + PROTOCOLS
// ======================================================
//
// This is VERY important in Swift.
//
// Extensions are often used to separate protocol
// conformance from the main type.

protocol Describable {

    func describe()
}


struct Product {

    let name: String
    let price: Double
}


// Instead of putting describe() inside Product,
// we can put the protocol implementation in
// an extension.

extension Product: Describable {

    func describe() {

        print(
            "\(name) costs \(price) FCFA"
        )
    }
}


let product = Product(
    name: "MacBook",
    price: 480000
)

product.describe()



// ======================================================
// 10. MULTIPLE PROTOCOLS WITH MULTIPLE EXTENSIONS
// ======================================================
//
// This is a very common way of organizing Swift code.

protocol Payable {

    func pay()
}


protocol Refundable {

    func refund()
}


struct Payment {

    let amount: Double
}


// Payment conformance

extension Payment: Payable {

    func pay() {

        print(
            "Paying \(amount) FCFA"
        )
    }
}


// Refund conformance

extension Payment: Refundable {

    func refund() {

        print(
            "Refunding \(amount) FCFA"
        )
    }
}


let payment = Payment(
    amount: 5000
)

payment.pay()
payment.refund()



// ======================================================
// 11. WHY SPLIT PROTOCOLS INTO EXTENSIONS?
// ======================================================
//
// Imagine a large type:
//
// struct User {
//
//     lots of properties...
//     lots of methods...
//     lots of logic...
// }
//
// It can become difficult to read.
//
// Instead:
//
// struct User {
//     properties...
// }
//
// extension User: Codable {
//     ...
// }
//
// extension User: Equatable {
//     ...
// }
//
// extension User: CustomStringConvertible {
//     ...
// }
//
// This keeps related functionality together.



// ======================================================
// 12. EXTENSIONS CANNOT ADD STORED PROPERTIES
// ======================================================
//
// This DOES NOT work:
//
// extension Person {
//
//     var address: String = "Cameroon"
// }
//
//
// ERROR:
//
// Extensions cannot contain stored properties.
//
//
// You CAN add a computed property:

extension Person {

    var country: String {

        return "Cameroon"
    }
}


print(person.country)



// ======================================================
// 13. EXTENSIONS CAN ACCESS PRIVATE MEMBERS
// ======================================================
//
// Extensions of the same type can have access to
// members depending on Swift's access-control rules.
//
// Example:

struct BankAccount {

    private var balance: Double

    init(balance: Double) {

        self.balance = balance
    }
}


extension BankAccount {

    func showBalance() {

        print(
            "Balance: \(balance)"
        )
    }
}


let account = BankAccount(
    balance: 100000
)

account.showBalance()



// ======================================================
// 14. PRACTICAL EXAMPLE
// ======================================================
//
// Imagine we have a User model.
//
// Instead of putting everything into one struct,
// we can organize functionality using extensions.

struct AppUser {

    let firstName: String
    let lastName: String
    let age: Int
}


// MARK: - Computed Properties

extension AppUser {

    var fullName: String {

        return "\(firstName) \(lastName)"
    }

    var isAdult: Bool {

        return age >= 18
    }
}


// MARK: - User Actions

extension AppUser {

    func introduce() {

        print(
            "Hello, my name is \(fullName)"
        )
    }
}


// MARK: - Validation

extension AppUser {

    func isValid() -> Bool {

        return !firstName.isEmpty &&
               !lastName.isEmpty &&
               age >= 0
    }
}


let appUser = AppUser(
    firstName: "Noel",
    lastName: "Bansikah",
    age: 25
)

print(appUser.fullName)
print(appUser.isAdult)

appUser.introduce()

print(appUser.isValid())



// ======================================================
// 15. EXTENSIONS + PROTOCOLS + DEFAULT IMPLEMENTATION
// ======================================================
//
// We can also use extensions to provide default
// behavior for protocols.

protocol Logger {

    func log(message: String)
}


extension Logger {

    func log(message: String) {

        print("[LOG]: \(message)")
    }
}


// Any type conforming to Logger automatically
// receives the default implementation.

struct AppService: Logger {

}


let service = AppService()

service.log(
    message: "Application started"
)



// ======================================================
// 16. EXTENDING DATE
// ======================================================
//
// Extensions are especially useful for making
// Foundation types easier to work with.

extension Date {

    var year: Int {

        Calendar.current.component(
            .year,
            from: self
        )
    }
}


let today = Date()

print(today.year)



// ======================================================
// 17. ORGANIZING EXTENSIONS INTO FILES
// ======================================================
//
// In a real project, you can put extensions in
// separate files.
//
// Example:
//
// User.swift
//
// struct User {
//     let name: String
//     let age: Int
// }
//
//
//
// User+Validation.swift
//
// extension User {
//
//     func isValid() -> Bool {
//         ...
//     }
// }
//
//
//
// User+Display.swift
//
// extension User {
//
//     var displayName: String {
//         ...
//     }
// }
//
//
//
// The "+" naming convention is commonly used:
//
// User+Validation.swift
// User+Display.swift
// User+API.swift



// ======================================================
// 18. EXTENSIONS ARE NOT INHERITANCE
// ======================================================
//
// IMPORTANT:
//
// Extension:
//
// extension Person {
//
//     func greet() {
//         ...
//     }
// }
//
//
//
// This means:
//
// "Add functionality to Person."
//
//
//
// It does NOT mean:
//
// "Create a child class of Person."
//
//
//
// Inheritance:
//
// class Employee: Person
//
// means Employee IS-A Person.
//
//
//
// Extension:
//
// extension Person
//
// means we are adding functionality to Person itself.



// ======================================================
// 19. EXTENSIONS + OPAQUE RETURN TYPES
// ======================================================
//
// Extensions can also be useful with SwiftUI.
//
// You will often see:
//
// extension View {
//
//     ...
// }
//
// SwiftUI itself uses protocols + extensions heavily.
//
// For example, a custom View modifier can be created
// using an extension.
//
// You don't need to master this yet, but this is
// where these concepts start coming together.



// ======================================================
// 20. QUICK SUMMARY
// ======================================================
//
// EXTENSION
//
//     extension TypeName {
//
//         // additional functionality
//
//     }
//
//
//
// CAN ADD:
//
// ✓ Methods
// ✓ Computed properties
// ✓ Computed static properties
// ✓ Static methods
// ✓ Initializers
// ✓ Protocol conformance
// ✓ Nested types
//
//
//
// CANNOT ADD:
//
// ✗ Stored instance properties
// ✗ Stored type properties
//
//
//
// COMMON USES:
//
// 1. Keep large types organized
//
// 2. Add functionality to existing types
//
// 3. Extend Swift/Foundation types
//
// 4. Separate protocol conformances
//
// 5. Add helper methods
//
// 6. Keep code easier to maintain
//
//
//
// MOST IMPORTANT IDEA:
//
// A protocol says:
//
// "What should this type be able to do?"
//
// An extension can say:
//
// "Here is the implementation."
//
// Example:
//
// protocol Payable {
//
//     func pay()
// }
//
// extension Payment: Payable {
//
//     func pay() {
//         print("Paying...")
//     }
// }
//
// ======================================================
