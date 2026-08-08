// Noel Bansikah 08/08/2026

// ==============================
// SWIFT CLOSURES - QUICK NOTES
// ==============================

// A closure is a block of code that can be
// stored in a variable, passed to a function,
// and executed later.

// 1. Basic closure
let greet = {
    print("Hello Swift")
}

greet() // Execute the closure


// 2. Closure with a parameter
let greetUser = { (name: String) in
    print("Hello \(name)")
}

greetUser("Noel")


// 3. Closure that returns a value
let add = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = add(10, 5)
print(result) // 15


// 4. Passing a closure to a function
func calculate(
    a: Int,
    b: Int,
    operation: (Int, Int) -> Int
) -> Int {
    return operation(a, b)
}

// The closure tells calculate() WHAT operation to perform.
let total = calculate(a: 10, b: 5) {
    $0 + $1
}

print(total) // 15


// 5. Closures with arrays
let numbers = [1, 2, 3, 4, 5]

// map() transforms every item
let doubled = numbers.map {
    $0 * 2
}

print(doubled) // [2, 4, 6, 8, 10]


// filter() keeps items that satisfy a condition
let evenNumbers = numbers.filter {
    $0 % 2 == 0
}

print(evenNumbers) // [2, 4]


// IMPORTANT:
// $0 = first parameter
// $1 = second parameter
//
// Use closures when you have small pieces of behavior
// that you want to pass around or execute later.
//
// Example in SwiftUI:
// Button("Save") {
//     saveData()
// }
//
// The { ... } is a closure.
