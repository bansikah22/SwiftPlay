import Foundation

// ======================================================
// 1. LIMITING ACCESS IN A STRUCT
// ======================================================

// By default, properties are accessible from outside.
//
// private means:
// "Only this struct can access this property."

struct BankAccount {

    let owner: String

    private var balance: Double = 0

    // This method can access the private balance.
    func showBalance() {
        print("Balance: \(balance)")
    }

    // Because this method changes balance,
    // it must be marked as mutating.
    mutating func deposit(amount: Double) {
        balance += amount
    }
}

var account = BankAccount(owner: "Noel")

account.deposit(amount: 500)
account.showBalance()

// This would NOT work:
// account.balance = 10000
//
// Why?
// balance is private.
// Only BankAccount itself can directly access it.



// ======================================================
// 2. CUSTOM INITIALIZER
// ======================================================

// Swift normally gives us an initializer automatically:
//
// Person(name: "Noel", age: 25)
//
// But we can create our own initializer when we
// want custom logic.

struct Person {

    let name: String
    let age: Int

    init(name: String, age: Int) {

        self.name = name
        self.age = age

    }
}

let person = Person(
    name: "Noel",
    age: 25
)

print(person.name)
print(person.age)



// ======================================================
// 3. CUSTOM INITIALIZER WITH LOGIC
// ======================================================

// An initializer can also modify or validate data
// before creating the struct.

struct User {

    let username: String
    let age: Int

    init(username: String, age: Int) {

        self.username = username

        // Don't allow a negative age.
        if age < 0 {
            self.age = 0
        } else {
            self.age = age
        }
    }
}

let user = User(
    username: "Noel",
    age: 25
)

print(user.username)
print(user.age)



// ======================================================
// 4. STATIC VARIABLES
// ======================================================

// A normal property belongs to each INSTANCE.
//
// A static property belongs to the STRUCT itself.
//
// You don't need to create an instance to access it.

struct AppConfig {

    static let appName = "My Swift App"
    static let version = "1.0"
}

print(AppConfig.appName)
print(AppConfig.version)

// Notice:
//
// AppConfig.appName
//
// NOT:
//
// app.appName



// ======================================================
// 5. STATIC METHODS
// ======================================================

// A static method also belongs to the STRUCT itself.
//
// You can call it without creating an instance.

struct Calculator {

    static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    static func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}

let sum = Calculator.add(10, 5)
let product = Calculator.multiply(10, 5)

print(sum)       // 15
print(product)   // 50



// ======================================================
// 6. STATIC + INSTANCE PROPERTIES TOGETHER
// ======================================================

struct Product {

    // Static property belongs to Product itself.
    static let currency = "FCFA"

    // These belong to each Product instance.
    let name: String
    let price: Double

    // Instance method
    func displayPrice() {
        print("\(name): \(price) \(Product.currency)")
    }
}

let laptop = Product(
    name: "MacBook",
    price: 480000
)

let phone = Product(
    name: "iPhone",
    price: 350000
)

laptop.displayPrice()
phone.displayPrice()

// Access static property directly:
//
// Product.currency
//
// Access instance property through an instance:
//
// laptop.price
// phone.price



// ======================================================
// 7. PRIVATE + STATIC
// ======================================================

// Static properties can also be private.
//
// This is useful when you have something that should
// only be used internally by the struct.

struct UserManager {

    private static var userCount = 0

    static func createUser() {

        userCount += 1

        print("Users created: \(userCount)")
    }
}

UserManager.createUser()
UserManager.createUser()
UserManager.createUser()

// Output:
//
// Users created: 1
// Users created: 2
// Users created: 3
