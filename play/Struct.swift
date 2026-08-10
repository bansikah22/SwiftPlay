// 10/08/2026

// ========================================
// SWIFT STRUCTS - QUICK NOTES
// ========================================

// A struct is a custom type that groups related
// data (properties) and behavior (methods) together.
//
// Think of a struct as a blueprint.
//
// Example:
// A Person has a name, age, and country.

// 1. Creating a struct

struct Person {
    let name: String
    let age: Int
    let country: String
}


// 2. Creating an instance of the struct

let person = Person(
    name: "Noel",
    age: 25,
    country: "Cameroon"
)


// Accessing properties

print(person.name)       // Noel
print(person.age)        // 25
print(person.country)    // Cameroon


// 3. Struct with a method
//
// A method is a function that belongs to the struct.

struct Person {
    let name: String
    let age: Int

    func introduce() {
        print("My name is \(name) and I am \(age) years old.")
    }
}

let person = Person(
    name: "Noel",
    age: 25
)

person.introduce()


// 4. Struct with mutable properties
//
// Use var when a property should be changed.

struct User {
    var name: String
    var age: Int
}

var user = User(
    name: "Noel",
    age: 25
)

user.age = 26

print(user.age) // 26


// 5. Mutating methods
//
// A method that changes a property of a struct
// must use the "mutating" keyword.

struct Counter {
    var count: Int = 0

    mutating func increment() {
        count += 1
    }
}

var counter = Counter()

counter.increment()
counter.increment()

print(counter.count) // 2


// 6. Structs can be used in arrays

struct Product {
    let name: String
    let price: Double
}

let products = [
    Product(name: "Laptop", price: 1000),
    Product(name: "Phone", price: 500),
    Product(name: "Keyboard", price: 100)
]

for product in products {
    print("\(product.name): \(product.price)")
}


// 7. Structs can be passed to functions

func printPerson(_ person: Person) {
    print("Name: \(person.name)")
}

printPerson(person)


// ========================================
// IMPORTANT
// ========================================

// struct = blueprint
//
// instance = an actual object created from the blueprint
//
// Example:
//
// struct Person { ... }        <- blueprint
//
// let person = Person(...)     <- actual instance
//
// person.name                  <- access property
//
// person.introduce()           <- call method
//
// Structs are commonly used in real Swift apps
// to represent things like:
//
// User
// Product
// Transaction
// Order
// Payment
// Message
// etc.
