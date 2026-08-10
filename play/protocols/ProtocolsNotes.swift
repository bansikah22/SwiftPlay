import Foundation

// ======================================================
// SWIFT PROTOCOLS - COMPLETE NOTES
// ======================================================
//
// A protocol defines requirements that a type must follow.
//
// It can define:
// - Properties
// - Methods
// - Initializers
// - Static requirements
//
// A struct, class, or enum can conform to a protocol.
//
// Think of a protocol as a CONTRACT:
//
// "If you conform to me, you must provide these things."



// ======================================================
// 1. CREATING A BASIC PROTOCOL
// ======================================================

protocol Vehicle {

    // Requirement for a property
    var brand: String { get }

    // Requirement for a method
    func start()
}


// ======================================================
// 2. CONFORMING TO A PROTOCOL
// ======================================================
//
// A type conforms using:
//
// struct Car: Vehicle
//
// The ":" means Car conforms to Vehicle.

struct Car: Vehicle {

    let brand: String

    func start() {
        print("\(brand) is starting...")
    }
}


let car = Car(brand: "Toyota")

print(car.brand)
car.start()



// ======================================================
// 3. ANOTHER TYPE CAN CONFORM
// ======================================================
//
// Different types can conform to the same protocol.
//
// They don't have to be classes.

struct Motorcycle: Vehicle {

    let brand: String

    func start() {
        print("\(brand) motorcycle is starting...")
    }
}


let motorcycle = Motorcycle(brand: "Honda")

motorcycle.start()



// ======================================================
// 4. PROTOCOLS DEFINE WHAT, NOT HOW
// ======================================================
//
// The protocol says:
//
// "You must have start()"
//
// But it doesn't say HOW start() should work.
//
// Car decides how:
//     print("Car is starting")
//
// Motorcycle decides how:
//     print("Motorcycle is starting")



// ======================================================
// 5. PROTOCOL PROPERTIES
// ======================================================

protocol Employee {

    var name: String { get }

    var salary: Double { get set }

    func work()
}


struct Developer: Employee {

    let name: String

    var salary: Double

    func work() {
        print("\(name) is writing code.")
    }
}


var developer = Developer(
    name: "Noel",
    salary: 500000
)

developer.work()

developer.salary = 600000

print(developer.salary)



// ======================================================
// 6. get vs get set
// ======================================================
//
// { get }
//     The property must be readable.
//
// { get set }
//     The property must be readable AND writable.

protocol UserProtocol {

    var name: String { get }

    var age: Int { get set }
}


struct User: UserProtocol {

    let name: String

    var age: Int
}


var user = User(
    name: "Noel",
    age: 25
)

user.age = 26



// ======================================================
// 7. PROTOCOL WITH MULTIPLE REQUIREMENTS
// ======================================================

protocol PaymentMethod {

    var amount: Double { get }

    func pay()

    func refund()
}


struct MobileMoney: PaymentMethod {

    let amount: Double

    func pay() {
        print("Paying \(amount) FCFA with Mobile Money")
    }

    func refund() {
        print("Refunding \(amount) FCFA")
    }
}


let payment = MobileMoney(amount: 5000)

payment.pay()
payment.refund()



// ======================================================
// 8. CLASSES CAN CONFORM TO PROTOCOLS
// ======================================================

protocol Animal {

    var name: String { get }

    func makeSound()
}


class Dog: Animal {

    let name: String

    init(name: String) {
        self.name = name
    }

    func makeSound() {
        print("\(name) says Woof!")
    }
}


let dog = Dog(name: "Buddy")

dog.makeSound()



// ======================================================
// 9. ENUMS CAN CONFORM TO PROTOCOLS
// ======================================================

protocol Describable {

    func describe()
}


enum Direction: Describable {

    case north
    case south
    case east
    case west

    func describe() {

        print("Direction: \(self)")
    }
}


let direction = Direction.north

direction.describe()



// ======================================================
// 10. ONE TYPE CAN CONFORM TO MULTIPLE PROTOCOLS
// ======================================================
//
// Separate protocols using commas.
//
// This is an important alternative to multiple inheritance.

protocol Flyable {

    func fly()
}

protocol Swimmable {

    func swim()
}


struct Duck: Flyable, Swimmable {

    func fly() {
        print("Duck is flying")
    }

    func swim() {
        print("Duck is swimming")
    }
}


let duck = Duck()

duck.fly()
duck.swim()



// ======================================================
// 11. PROTOCOL INHERITANCE
// ======================================================
//
// A protocol can inherit requirements from another
// protocol.

protocol AnimalProtocol {

    var name: String { get }

    func makeSound()
}


protocol Pet: AnimalProtocol {

    func play()
}


struct Cat: Pet {

    let name: String

    func makeSound() {
        print("\(name) says Meow!")
    }

    func play() {
        print("\(name) is playing")
    }
}


let cat = Cat(name: "Milo")

cat.makeSound()
cat.play()



// ======================================================
// 12. USING A PROTOCOL AS A TYPE
// ======================================================
//
// This is one of the most powerful things about protocols.
//
// We can create a variable whose type is a protocol.
//
// It doesn't care about the specific type.
//
// It only cares that the type conforms to the protocol.

let vehicle: Vehicle = Car(brand: "BMW")

vehicle.start()


// We can also create an array of protocol types.

let vehicles: [Vehicle] = [

    Car(brand: "Toyota"),

    Motorcycle(brand: "Honda"),

    Car(brand: "BMW")
]


for vehicle in vehicles {

    vehicle.start()
}



// ======================================================
// 13. POLYMORPHISM WITH PROTOCOLS
// ======================================================
//
// This is similar to the polymorphism we saw with classes.
//
// Different types can conform to the same protocol.
//
// The caller only cares about the protocol.

func startVehicle(_ vehicle: Vehicle) {

    vehicle.start()
}


startVehicle(
    Car(brand: "Toyota")
)

startVehicle(
    Motorcycle(brand: "Honda")
)



// ======================================================
// 14. PROTOCOL EXTENSIONS
// ======================================================
//
// Protocol extensions allow us to provide a default
// implementation.
//
// This means conforming types don't always need to
// implement every method themselves.

protocol Greeting {

    func greet()
}


extension Greeting {

    func greet() {

        print("Hello!")
    }
}


// User doesn't implement greet().
// It automatically receives the default implementation.

struct Person: Greeting {

}


let person = Person()

person.greet()



// ======================================================
// 15. OVERRIDING THE DEFAULT IMPLEMENTATION
// ======================================================
//
// A conforming type can provide its own implementation.

struct SpecialPerson: Greeting {

    func greet() {

        print("Hello! Nice to meet you.")
    }
}


let specialPerson = SpecialPerson()

specialPerson.greet()



// ======================================================
// 16. PROTOCOL EXTENSIONS WITH USEFUL BEHAVIOR
// ======================================================

protocol IdentifiableUser {

    var id: Int { get }
    var name: String { get }
}


extension IdentifiableUser {

    func displayInfo() {

        print(
            "ID: \(id), Name: \(name)"
        )
    }
}


struct Customer: IdentifiableUser {

    let id: Int
    let name: String
}


let customer = Customer(
    id: 1,
    name: "Noel"
)

customer.displayInfo()



// ======================================================
// 17. PROTOCOL INITIALIZER REQUIREMENTS
// ======================================================
//
// A protocol can require an initializer.

protocol VehicleFactory {

    init(brand: String)
}


struct CarFactory: VehicleFactory {

    let brand: String

    init(brand: String) {

        self.brand = brand
    }
}


let factoryCar = CarFactory(
    brand: "Toyota"
)

print(factoryCar.brand)



// ======================================================
// 18. PROTOCOLS + DEPENDENCY INJECTION
// ======================================================
//
// This is something you will eventually use in real
// applications.
//
// Instead of making a class depend on a specific
// implementation, make it depend on a protocol.

protocol PaymentService {

    func pay(amount: Double)
}


struct MobileMoneyService: PaymentService {

    func pay(amount: Double) {

        print(
            "Mobile Money payment: \(amount) FCFA"
        )
    }
}


struct BankService: PaymentService {

    func pay(amount: Double) {

        print(
            "Bank payment: \(amount) FCFA"
        )
    }
}


// Our function doesn't care which payment service
// it receives.
//
// It only requires something that conforms to
// PaymentService.

func checkout(
    service: PaymentService,
    amount: Double
) {

    service.pay(amount: amount)
}


let mobileMoneyService = MobileMoneyService()

let bankService = BankService()


checkout(
    service: mobileMoneyService,
    amount: 5000
)


checkout(
    service: bankService,
    amount: 10000
)



// ======================================================
// 19. PROTOCOL COMPOSITION
// ======================================================
//
// A value can be required to conform to multiple
// protocols.
//
// Example:
//
// Flyable & Swimmable
//
// means:
// "Must conform to BOTH protocols."

func operate(
    animal: Flyable & Swimmable
) {

    animal.fly()
    animal.swim()
}


operate(animal: duck)



// ======================================================
// 20. PRACTICAL PROJECT EXAMPLE
// ======================================================
//
// Imagine we're building a payment application.
//
// Instead of creating one giant Payment class,
// we can describe capabilities with protocols.

protocol Payable {

    func pay()
}


protocol Refundable {

    func refund()
}


protocol ReceiptGeneratable {

    func generateReceipt()
}


struct MobileMoneyPayment:
    Payable,
    Refundable,
    ReceiptGeneratable {

    let amount: Double

    func pay() {

        print(
            "Mobile Money payment: \(amount) FCFA"
        )
    }

    func refund() {

        print(
            "Refunding \(amount) FCFA"
        )
    }

    func generateReceipt() {

        print(
            "Generating Mobile Money receipt..."
        )
    }
}


let mobilePayment = MobileMoneyPayment(
    amount: 5000
)

mobilePayment.pay()
mobilePayment.refund()
mobilePayment.generateReceipt()



// ======================================================
// IMPORTANT SUMMARY
// ======================================================
//
// PROTOCOL
//     ↓
// Defines requirements / contract.
//
// STRUCT / CLASS / ENUM
//     ↓
// Conforms to the protocol.
//
// Example:
//
// protocol Payable {
//     func pay()
// }
//
// struct MobileMoney: Payable {
//     func pay() {
//         ...
//     }
// }
//
//
// ======================================================
//
// IMPORTANT DIFFERENCES
//
// CLASS INHERITANCE:
//
// class Dog: Animal
//
// A class inherits from another class.
//
//
//
// PROTOCOL CONFORMANCE:
//
// struct Dog: AnimalProtocol
//
// The struct agrees to satisfy the protocol requirements.
//
//
//
// MULTIPLE PROTOCOLS:
//
// struct Duck: Flyable, Swimmable
//
// A type can conform to multiple protocols.
//
//
//
// PROTOCOL EXTENSION:
//
// extension Greeting {
//     func greet() {
//         print("Hello")
//     }
// }
//
// Provides shared/default behavior.
//
//
//
// PROTOCOL AS A TYPE:
//
// let vehicle: Vehicle = Car(...)
//
// The code only cares that the object conforms
// to Vehicle.
//
//
// ======================================================
//
// THE BIG IDEA:
//
// Protocol = "What can you do?"
//
// Implementation = "How do you do it?"
//
// Example:
//
// Payable
//     ↓
// "You must be able to pay."
//
// MobileMoney
//     ↓
// "Here is HOW I pay."
//
// Bank
//     ↓
// "Here is HOW I pay."
//
// Card
//     ↓
// "Here is HOW I pay."
//
// This allows different types to follow the same
// contract while implementing the behavior differently.
