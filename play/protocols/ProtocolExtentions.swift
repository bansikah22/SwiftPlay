import Foundation

// ======================================================
// SWIFT PROTOCOL EXTENSIONS - COMPLETE NOTES
// ======================================================
//
// A protocol defines a CONTRACT.
//
// A protocol extension provides DEFAULT BEHAVIOR
// for that contract.
//
// Basic idea:
//
// protocol Animal {
//     func makeSound()
// }
//
// extension Animal {
//     func makeSound() {
//         print("Some sound")
//     }
// }
//
// Now any type that conforms to Animal automatically
// gets the default implementation.
//
// ======================================================


// ======================================================
// 1. CREATE A BASIC PROTOCOL
// ======================================================

protocol Animal {

    func makeSound()
}


// ======================================================
// 2. CREATE A PROTOCOL EXTENSION
// ======================================================
//
// We provide a default implementation of makeSound().
//
// Any type conforming to Animal can now use it.

extension Animal {

    func makeSound() {

        print("The animal makes a sound")
    }
}


// ======================================================
// 3. USE THE DEFAULT IMPLEMENTATION
// ======================================================
//
// Dog conforms to Animal.
//
// But Dog does NOT implement makeSound().
//
// That's okay because the protocol extension provides
// the implementation.

struct Dog: Animal {

}


let dog = Dog()

dog.makeSound()

// Output:
//
// The animal makes a sound



// ======================================================
// 4. PROVIDING YOUR OWN IMPLEMENTATION
// ======================================================
//
// A conforming type can provide its own implementation.
//
// The protocol extension provides the DEFAULT.
//
// The type can replace that default with its own behavior.

struct Cat: Animal {

    func makeSound() {

        print("Meow!")
    }
}


let cat = Cat()

cat.makeSound()

// Output:
//
// Meow!



// ======================================================
// 5. WHAT IS ACTUALLY HAPPENING?
// ======================================================
//
// We have:
//
// protocol Animal
//       ↓
// defines makeSound()
//
// extension Animal
//       ↓
// provides default makeSound()
//
// Dog
//       ↓
// uses default implementation
//
// Cat
//       ↓
// provides its own implementation
//
//
//
// Think:
//
// Animal
//   │
//   ├── Dog
//   │    └── uses default
//   │
//   └── Cat
//        └── custom implementation



// ======================================================
// 6. PROTOCOL EXTENSIONS CAN HAVE MULTIPLE METHODS
// ======================================================

protocol Employee {

    var name: String { get }

    func work()
    func takeBreak()
}


extension Employee {

    func work() {

        print("\(name) is working.")
    }

    func takeBreak() {

        print("\(name) is taking a break.")
    }
}


struct Developer: Employee {

    let name: String
}


let developer = Developer(
    name: "Noel"
)

developer.work()
developer.takeBreak()

// Output:
//
// Noel is working.
// Noel is taking a break.



// ======================================================
// 7. OVERRIDING DEFAULT BEHAVIOR
// ======================================================
//
// A type can provide its own implementation.

struct Designer: Employee {

    let name: String

    func work() {

        print(
            "\(name) is designing the application."
        )
    }

    // takeBreak() is not implemented,
    // so the default implementation is used.
}


let designer = Designer(
    name: "Sarah"
)

designer.work()
designer.takeBreak()

// Output:
//
// Sarah is designing the application.
// Sarah is taking a break.



// ======================================================
// 8. PROTOCOL EXTENSIONS WITH COMPUTED PROPERTIES
// ======================================================
//
// Protocol extensions can also provide computed
// properties.

protocol User {

    var firstName: String { get }
    var lastName: String { get }
}


extension User {

    var fullName: String {

        return "\(firstName) \(lastName)"
    }
}


struct AppUser: User {

    let firstName: String
    let lastName: String
}


let user = AppUser(
    firstName: "Noel",
    lastName: "Bansikah"
)

print(user.fullName)

// Output:
//
// Noel Bansikah



// ======================================================
// 9. PROTOCOL EXTENSIONS WITH PARAMETERS
// ======================================================

protocol Calculator {

    func add(
        _ a: Int,
        _ b: Int
    ) -> Int
}


extension Calculator {

    func add(
        _ a: Int,
        _ b: Int
    ) -> Int {

        return a + b
    }
}


struct BasicCalculator: Calculator {

}


let calculator = BasicCalculator()

print(
    calculator.add(10, 20)
)

// Output:
//
// 30



// ======================================================
// 10. STATIC MEMBERS IN PROTOCOL EXTENSIONS
// ======================================================

protocol AppInfo {

}


extension AppInfo {

    static var appName: String {

        return "My Swift App"
    }
}


struct MyApp: AppInfo {

}


print(MyApp.appName)



// ======================================================
// 11. PROTOCOL EXTENSION WITH COLLECTIONS
// ======================================================
//
// This is where protocol extensions become really
// powerful.
//
// Swift uses protocols heavily for collections.
//
// We can create our own protocol and give it
// reusable behavior.

protocol Describable {

    var description: String { get }
}


extension Describable {

    func printDescription() {

        print(
            "Description: \(description)"
        )
    }
}


struct Product: Describable {

    let description: String
}


let product = Product(
    description: "MacBook Pro M1 Pro"
)

product.printDescription()



// ======================================================
// 12. MULTIPLE PROTOCOLS
// ======================================================
//
// A type can conform to multiple protocols.

protocol Payable {

    func pay()
}


protocol Refundable {

    func refund()
}


extension Payable {

    func pay() {

        print("Processing payment...")
    }
}


extension Refundable {

    func refund() {

        print("Processing refund...")
    }
}


struct MobileMoney: Payable, Refundable {

}


let mobileMoney = MobileMoney()

mobileMoney.pay()
mobileMoney.refund()



// ======================================================
// 13. DIFFERENT TYPES CAN REUSE THE SAME BEHAVIOR
// ======================================================
//
// This is one of the biggest benefits.
//
// Car, Motorcycle and Truck can all conform
// to the same protocol.
//
// They automatically receive the same behavior.

protocol Vehicle {

    var brand: String { get }

    func start()
}


extension Vehicle {

    func start() {

        print(
            "\(brand) is starting..."
        )
    }
}


struct Car: Vehicle {

    let brand: String
}


struct Motorcycle: Vehicle {

    let brand: String
}


struct Truck: Vehicle {

    let brand: String
}


let car = Car(brand: "Toyota")

let motorcycle = Motorcycle(
    brand: "Honda"
)

let truck = Truck(
    brand: "Volvo"
)


car.start()
motorcycle.start()
truck.start()



// ======================================================
// 14. ONE TYPE CAN CUSTOMIZE THE DEFAULT
// ======================================================

struct ElectricCar: Vehicle {

    let brand: String

    func start() {

        print(
            "\(brand) starts silently using electricity."
        )
    }
}


let electricCar = ElectricCar(
    brand: "Tesla"
)

electricCar.start()



// ======================================================
// 15. PROTOCOL EXTENSION + POLYMORPHISM
// ======================================================
//
// We can use the protocol as a type.

let vehicles: [any Vehicle] = [

    Car(brand: "Toyota"),

    Motorcycle(brand: "Honda"),

    Truck(brand: "Volvo"),

    ElectricCar(brand: "Tesla")
]


for vehicle in vehicles {

    vehicle.start()
}



// ======================================================
// 16. IMPORTANT: STATIC DISPATCH DETAIL
// ======================================================
//
// This is one of the more advanced details you should
// know about protocol extensions.
//
// Suppose a method exists ONLY in the protocol extension.
//
// Example:

protocol Speaker {

    func speak()
}


extension Speaker {

    func speak() {

        print("Default speaking")
    }

    func introduce() {

        print("Hello from the protocol extension")
    }
}


struct PersonSpeaker: Speaker {

    func speak() {

        print("Person speaking")
    }

    func introduce() {

        print("Hello, I am Noel")
    }
}


let personSpeaker = PersonSpeaker()

personSpeaker.speak()

personSpeaker.introduce()



// Directly using the concrete type:
//
// PersonSpeaker's implementations are used.
//
// Output:
//
// Person speaking
// Hello, I am Noel



// ======================================================
// 17. WHY PROTOCOL REQUIREMENTS MATTER
// ======================================================
//
// If you want dynamic dispatch through the protocol,
// the method should be declared in the protocol itself.
//
// Example:

protocol Speaker2 {

    func speak()

    func introduce()
}


extension Speaker2 {

    func speak() {

        print("Default speaking")
    }

    func introduce() {

        print("Default introduction")
    }
}


struct PersonSpeaker2: Speaker2 {

    func speak() {

        print("Person speaking")
    }

    func introduce() {

        print("Hello, I am Noel")
    }
}


let speaker: any Speaker2 = PersonSpeaker2()

speaker.speak()

speaker.introduce()



// Because both methods are requirements of the
// protocol, the conforming type's implementation
// can be used through the protocol type.



// ======================================================
// 18. REALISTIC PAYMENT EXAMPLE
// ======================================================
//
// Imagine a payment application.
//
// We want every payment method to be able to:
//
// - pay
// - refund
// - show information
//
// We can define that contract once.

protocol PaymentMethod {

    var amount: Double { get }

    func pay()

    func refund()

    func showDetails()
}


// ------------------------------------------------------
// DEFAULT BEHAVIOR
// ------------------------------------------------------

extension PaymentMethod {

    func refund() {

        print(
            "Refunding \(amount) FCFA"
        )
    }

    func showDetails() {

        print(
            "Payment amount: \(amount) FCFA"
        )
    }
}


// ------------------------------------------------------
// MOBILE MONEY
// ------------------------------------------------------

struct MobileMoneyPayment: PaymentMethod {

    let amount: Double

    let phoneNumber: String

    func pay() {

        print(
            "Sending \(amount) FCFA to \(phoneNumber)"
        )
    }

    // refund() uses the default implementation.
    //
    // showDetails() uses the default implementation.
}


// ------------------------------------------------------
// BANK PAYMENT
// ------------------------------------------------------

struct BankPayment: PaymentMethod {

    let amount: Double

    let accountNumber: String

    func pay() {

        print(
            "Sending \(amount) FCFA to bank account \(accountNumber)"
        )
    }

    // We can customize refund.

    func refund() {

        print(
            "Starting bank refund for \(amount) FCFA"
        )
    }

    // showDetails() still uses the default.
}


// ------------------------------------------------------
// USING THE PAYMENT METHODS
// ------------------------------------------------------

let mobilePayment = MobileMoneyPayment(
    amount: 5000,
    phoneNumber: "677123456"
)

let bankPayment = BankPayment(
    amount: 10000,
    accountNumber: "123456789"
)


mobilePayment.pay()
mobilePayment.refund()
mobilePayment.showDetails()


print("---")


bankPayment.pay()
bankPayment.refund()
bankPayment.showDetails()



// ======================================================
// 19. PROTOCOL EXTENSIONS CAN BE USED FOR VALIDATION
// ======================================================

protocol Validatable {

    func validate() -> Bool
}


extension Validatable {

    func validate() -> Bool {

        return true
    }
}


struct UserAccount: Validatable {

    let username: String
}


let account = UserAccount(
    username: "Noel"
)

print(account.validate())



// ======================================================
// 20. PROTOCOL EXTENSIONS + GENERICS
// ======================================================
//
// Protocol extensions become even more powerful
// when combined with generics.
//
// Here we create a protocol for things that can
// be displayed.

protocol Displayable {

    func display()
}


extension Array where Element: Displayable {

    func displayAll() {

        for item in self {

            item.display()
        }
    }
}


struct Item: Displayable {

    let name: String

    func display() {

        print(name)
    }
}


let items = [

    Item(name: "MacBook"),

    Item(name: "iPhone"),

    Item(name: "iPad")
]


items.displayAll()



// ======================================================
// 21. PROTOCOL EXTENSION WITH A CONDITION
// ======================================================
//
// We can provide functionality only when a type
// satisfies a certain requirement.
//
// Example:
//
// Only arrays whose elements conform to Displayable
// get displayAll().
//
// This is called a constrained extension.
//
//
// extension Array where Element: Displayable
//
// Means:
//
// "Extend Array, but only when Element conforms
// to Displayable."



// ======================================================
// 22. PROTOCOL EXTENSIONS IN REAL PROJECTS
// ======================================================
//
// Imagine:
//
// User.swift
//
// struct User {
//
//     let name: String
//     let age: Int
// }
//
//
//
// UserValidation.swift
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
// UserDisplay.swift
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
// Payment.swift
//
// protocol PaymentMethod {
//
//     func pay()
// }
//
//
//
// PaymentDefaults.swift
//
// extension PaymentMethod {
//
//     func refund() {
//         ...
//     }
// }
//
//
//
// This keeps a project organized.



// ======================================================
// 23. PROTOCOL VS PROTOCOL EXTENSION
// ======================================================
//
// PROTOCOL:
//
// Defines the requirement.
//
// Example:
//
// protocol Payable {
//
//     func pay()
// }
//
//
//
// PROTOCOL EXTENSION:
//
// Provides an implementation.
//
// Example:
//
// extension Payable {
//
//     func pay() {
//         print("Paying...")
//     }
// }
//
//
//
// Think:
//
// Protocol
//     ↓
// "You MUST be able to do this."
//
// Protocol Extension
//     ↓
// "Here is a DEFAULT way to do it."



// ======================================================
// 24. PROTOCOL EXTENSION VS NORMAL EXTENSION
// ======================================================
//
// NORMAL EXTENSION:
//
// Adds functionality to one specific type.
//
// extension User {
//
//     func login() {
//         ...
//     }
// }
//
//
//
// PROTOCOL EXTENSION:
//
// Adds default functionality to ALL types that
// conform to a protocol.
//
// extension Payable {
//
//     func pay() {
//         ...
//     }
// }



// ======================================================
// 25. PROTOCOL-ORIENTED PROGRAMMING
// ======================================================
//
// This is one of Swift's important programming styles.
//
// Instead of thinking:
//
// "What class should inherit from what?"
//
// You can think:
//
// "What capabilities does this type have?"
//
//
//
// Example:
//
// Payable
// Refundable
// Loggable
// Identifiable
//
// A type can adopt several capabilities:
//
// struct Payment:
//     Payable,
//     Refundable,
//     Loggable
//
//
//
// This is called COMPOSITION.
//
//
//
// ======================================================
// FINAL MENTAL MODEL
// ======================================================
//
//
// PROTOCOL
//
//     Defines a contract.
//
//     "A payment must be able to pay."
//
//
//
// PROTOCOL EXTENSION
//
//     Provides default behavior.
//
//     "Here is a default way to pay."
//
//
//
// CONFORMING TYPE
//
//     Can use the default or provide
//     its own implementation.
//
//
//
// Example:
//
// protocol Payable {
//
//     func pay()
// }
//
//
// extension Payable {
//
//     func pay() {
//
//         print("Default payment")
//     }
// }
//
//
// struct MobileMoney: Payable {
//
//     // Uses default pay()
// }
//
//
// struct Bank: Payable {
//
//     func pay() {
//
//         print("Bank payment")
//     }
// }
//
//
// ======================================================
//
// THE BIG IDEA:
//
// Protocol
//      ↓
// WHAT
//
// Protocol Extension
//      ↓
// DEFAULT HOW
//
// Conforming Type
//      ↓
// CAN ACCEPT DEFAULT OR PROVIDE ITS OWN HOW
//
// ======================================================
