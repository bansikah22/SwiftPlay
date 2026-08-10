import Foundation

// ======================================================
// SWIFT OPAQUE RETURN TYPES
// ======================================================
//
// Opaque return types use the keyword:
//
//     some
//
// Example:
//
//     func createVehicle() -> some Vehicle
//
// This means:
//
// "I will return ONE specific type that conforms
// to Vehicle, but I don't want to tell you exactly
// what that type is."



// ======================================================
// 1. BASIC EXAMPLE
// ======================================================

protocol Animal {

    func makeSound()
}


struct Dog: Animal {

    func makeSound() {
        print("Woof!")
    }
}


// The exact return type is hidden.
//
// We only expose that the returned value conforms
// to Animal.

func createAnimal() -> some Animal {

    return Dog()
}


let animal = createAnimal()

animal.makeSound()



// ======================================================
// 2. WHY NOT JUST RETURN Animal?
// ======================================================
//
// We could write:
//
// func createAnimal() -> Animal
//
// That would also work.
//
// But:
//
// -> Animal
//
// is an EXISTENTIAL / protocol-typed return.
//
// It means the caller receives a value whose concrete
// type may vary.
//
//
// -> some Animal
//
// is an OPAQUE return type.
//
// It means the implementation chooses ONE specific
// concrete type, but hides that type from the caller.



// ======================================================
// 3. THE IMPORTANT RULE
// ======================================================
//
// A function returning:
//
//     some Animal
//
// must always return the SAME underlying type.
//
// This works:

func createDog() -> some Animal {

    return Dog()
}


// This would NOT work:
//
// struct Cat: Animal {
//
//     func makeSound() {
//         print("Meow!")
//     }
// }
//
// func createAnimal() -> some Animal {
//
//     if Bool.random() {
//         return Dog()
//     } else {
//         return Cat()
//     }
// }
//
// ERROR:
//
// An opaque return type must represent
// one specific underlying type.
//
//
// Even though Dog and Cat both conform to Animal,
// they are different concrete types.



// ======================================================
// 4. ANOTHER SIMPLE EXAMPLE
// ======================================================

protocol Shape {

    func draw()
}


struct Circle: Shape {

    func draw() {
        print("Drawing a circle")
    }
}


func createShape() -> some Shape {

    return Circle()
}


let shape = createShape()

shape.draw()



// ======================================================
// 5. THE CONCRETE TYPE IS HIDDEN
// ======================================================
//
// The caller knows:
//
// "This is something that conforms to Shape."
//
// But the caller doesn't need to know:
//
// "This is specifically a Circle."

func createShape() -> some Shape {

    return Circle()
}


// We simply use the protocol's capabilities:

let myShape = createShape()

myShape.draw()



// ======================================================
// 6. WHY IS THIS USEFUL?
// ======================================================
//
// Opaque return types are useful when you want to:
//
// 1. Hide implementation details
// 2. Expose only capabilities
// 3. Keep your API clean
// 4. Allow the implementation to change later
//
// For example:
//
// Today:
//
// return Circle()
//
// Later:
//
// return Square()
//
// As long as the returned type conforms to Shape,
// the caller doesn't need to know the implementation.



// ======================================================
// 7. OPAQUE RETURN TYPES + PROTOCOLS
// ======================================================
//
// This is where opaque return types become
// particularly useful.
//
// Protocol:

protocol PaymentProcessor {

    func process()
}


// Implementation:

struct MobileMoneyProcessor: PaymentProcessor {

    func process() {
        print("Processing Mobile Money...")
    }
}


// Hide the concrete implementation:

func createPaymentProcessor() -> some PaymentProcessor {

    return MobileMoneyProcessor()
}


// The caller doesn't need to know that
// MobileMoneyProcessor is being used.

let processor = createPaymentProcessor()

processor.process()



// ======================================================
// 8. OPAQUE RETURN TYPE VS PROTOCOL RETURN TYPE
// ======================================================
//
// OPAQUE:
//
//     -> some PaymentProcessor
//
// Means:
//
// "There is ONE specific concrete type behind this,
// but I am hiding it."
//
//
//
// PROTOCOL TYPE:
//
//     -> any PaymentProcessor
//
// Means:
//
// "This value can contain any type that conforms
// to PaymentProcessor."



// ======================================================
// 9. SIMPLE COMPARISON
// ======================================================

protocol Vehicle {

    func start()
}


struct Car: Vehicle {

    func start() {
        print("Car starting")
    }
}


struct Motorcycle: Vehicle {

    func start() {
        print("Motorcycle starting")
    }
}


// OPAQUE RETURN
//
// Always returns ONE specific underlying type.

func createCar() -> some Vehicle {

    return Car()
}


// PROTOCOL / EXISTENTIAL RETURN
//
// Can return different conforming types.

func createVehicle() -> any Vehicle {

    if Bool.random() {

        return Car()

    } else {

        return Motorcycle()
    }
}


let car = createCar()

car.start()


let vehicle = createVehicle()

vehicle.start()



// ======================================================
// 10. WHY "some" IS DIFFERENT FROM "any"
// ======================================================
//
// This is VERY important.
//
//
// some Protocol
//     ↓
// ONE specific underlying type
// Hidden from the caller.
//
//
//
// any Protocol
//     ↓
// ANY type that conforms to the protocol
//
//
//
// Think:
//
// some = "I know the exact type."
//
// any  = "It could be different types."



// ======================================================
// 11. GENERICS VS OPAQUE RETURN TYPES
// ======================================================
//
// Generics allow the caller to determine the type.
//
// Example:

func echo<T>(_ value: T) -> T {

    return value
}


let number = echo(10)

let text = echo("Hello")


// T can be different depending on what
// the caller provides.



// With opaque return types:
//
// The FUNCTION decides the concrete type.
//
// Example:

func createNumber() -> some Equatable {

    return 10
}


// The function chooses Int as the underlying type.
//
// The caller doesn't need to know that detail.



// ======================================================
// 12. OPAQUE TYPES IN SWIFTUI
// ======================================================
//
// This is where you will see "some" constantly.
//
// SwiftUI views use:
//
//     some View
//
// Example:

// struct ContentView: View {
//
//     var body: some View {
//
//         Text("Hello Swift")
//     }
// }
//
//
//
// body doesn't return:
//
//     Text
//
// It returns:
//
//     some View
//
// Meaning:
//
// "body returns one specific type that conforms
// to the View protocol, but the exact type is hidden."



// ======================================================
// 13. WHY SWIFTUI NEEDS THIS
// ======================================================
//
// SwiftUI views can become complicated.
//
// For example:

// var body: some View {
//
//     VStack {
//
//         Text("Hello")
//
//         Button("Save") {
//
//             print("Saved")
//
//         }
//     }
// }
//
//
// The actual underlying type is much more complicated
// than just:
//
//     VStack
//
// SwiftUI uses:
//
//     some View
//
// to hide that implementation complexity.



// ======================================================
// 14. PRACTICAL SWIFTUI-STYLE EXAMPLE
// ======================================================

protocol ViewLike {

    func render()
}


struct TextView: ViewLike {

    let text: String

    func render() {
        print(text)
    }
}


func createView() -> some ViewLike {

    return TextView(
        text: "Hello Swift"
    )
}


let view = createView()

view.render()



// ======================================================
// 15. IMPORTANT LIMITATION
// ======================================================
//
// You cannot return different concrete types
// from different branches.
//
// This DOES NOT work:
//
// func createView() -> some ViewLike {
//
//     if Bool.random() {
//
//         return TextView(text: "Hello")
//
//     } else {
//
//         return AnotherView()
//     }
// }
//
//
//
// Why?
//
// Because:
//
//     some ViewLike
//
// requires ONE underlying concrete type.
//
//
//
// If you genuinely need different types,
// use:
//
//     any ViewLike
//
// instead.



// ======================================================
// 16. OPAQUE RETURN TYPES WITH COLLECTIONS
// ======================================================
//
// The same principle applies when returning
// collections.
//
// For example:

func createNumbers() -> some Collection {

    return [1, 2, 3, 4, 5]
}


let numbers = createNumbers()

print(numbers)



// The caller knows:
//
// "This is some Collection."
//
// But doesn't need to know the exact collection type.



// ======================================================
// 17. OPAQUE RETURN TYPE + METHODS
// ======================================================

protocol Worker {

    func work()
}


struct Developer: Worker {

    func work() {

        print("Writing Swift code...")
    }
}


func createWorker() -> some Worker {

    return Developer()
}


let worker = createWorker()

worker.work()



// ======================================================
// QUICK COMPARISON
// ======================================================
//
//
// 1. CONCRETE TYPE
//
// func createDog() -> Dog
//
// The caller knows exactly what type is returned.
//
//
//
// 2. PROTOCOL TYPE
//
// func createAnimal() -> any Animal
//
// The caller knows the value conforms to Animal,
// but it could contain different concrete types.
//
//
//
// 3. OPAQUE TYPE
//
// func createAnimal() -> some Animal
//
// The implementation chooses ONE concrete type,
// but the caller doesn't know what that type is.
//
//
//
// 4. GENERIC
//
// func identity<T>(_ value: T) -> T
//
// The caller provides the type and the function
// works with that type.
//
//
//
// ======================================================
//
// FINAL MENTAL MODEL
//
//
//
// CONCRETE:
//
//     -> Dog
//
// "I am telling you exactly what I return."
//
//
//
// any Animal:
//
//     -> any Animal
//
// "I can return different Animal types."
//
//
//
// some Animal:
//
//     -> some Animal
//
// "I return one specific Animal type,
// but I'm hiding exactly which one."
//
//
//
// GENERIC:
//
//     -> <T>
//
// "You give me the type and I work with it."
//
// ======================================================
