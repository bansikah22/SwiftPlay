//
// Noel Bansikah 05/08/2026

import Foundation

// Generic Function
func printValue<T>(_ value: T) {
    print("Value: \(value)")
}

// Generic Function Returning a Value
func echo<T>(_ value: T) -> T {
    return value
}

// Generic Struct
struct Box<T> {
    let value: T
}

// Generic Function With Arrays
func printItems<T>(_ items: [T]) {
    for item in items {
        print(item)
    }
}

// Testing

printValue("Swift")
printValue(100)
printValue(true)

let message = echo("Hello Generics")
print(message)

let intBox = Box(value: 42)
let stringBox = Box(value: "Noel")

print(intBox.value)
print(stringBox.value)

printItems([1, 2, 3])
printItems(["Apple", "Banana", "Orange"])
