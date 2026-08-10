import Foundation

// ======================================================
// SWIFT OPTIONALS - COMPLETE NOTES
// ======================================================
//
// An Optional represents a value that MAY or MAY NOT exist.
//
// Example:
//
//     String
//
// means:
//
//     "I have a String."
//
//
//
//     String?
//
// means:
//
//     "I might have a String, or I might have nil."
//
//
//
// nil means:
//
//     "There is no value."



// ======================================================
// 1. CREATING AN OPTIONAL
// ======================================================

var name: String? = "Noel"

print(name)


// We can also set it to nil.

name = nil

print(name)


// Output:
//
// Optional("Noel")
// nil



// ======================================================
// 2. WHY DOES SWIFT USE OPTIONALS?
// ======================================================
//
// Imagine looking for a user in a database.
//
// Maybe the user exists.
//
// Maybe they don't.
//
// Without optionals, you might accidentally assume
// the user always exists.
//
// Swift forces you to acknowledge the possibility:
//
// User?
//
// This makes your code safer.



// ======================================================
// 3. OPTIONAL VS NON-OPTIONAL
// ======================================================

let normalName: String = "Noel"

// This MUST contain a String.
//
// It cannot be nil.


// Optional String:

let optionalName: String? = "Noel"

// This can contain:
//
// "Noel"
//
// OR:
//
// nil



// ======================================================
// 4. OPTIONAL BINDING WITH if let
// ======================================================
//
// One of the most common ways to safely use an optional.
//
// Example:

let username: String? = "Noel"


if let username = username {

    print(
        "Username is \(username)"
    )

} else {

    print(
        "No username found"
    )
}


// If username contains a value:
//
// Username is Noel
//
// If username is nil:
//
// No username found



// ======================================================
// 5. HOW if let WORKS
// ======================================================
//
// This:
//
// if let username = username
//
// means:
//
// "If username contains a value,
// unwrap it and put the value into username."
//
// Inside the if block:
//
// username
//
// is a normal String.
//
// Outside the block:
//
// username
//
// is still:
//
// String?



let name2: String? = "Taylor"


if let name2 = name2 {

    // name2 is String here.

    print(name2.count)
}


// ======================================================
// 6. OPTIONAL BINDING WITH A DIFFERENT VARIABLE NAME
// ======================================================

let email: String? = "noel@example.com"


if let actualEmail = email {

    print(
        "Email: \(actualEmail)"
    )
}


// This can sometimes make code easier to understand.



// ======================================================
// 7. MULTIPLE OPTIONAL VALUES
// ======================================================

let firstName: String? = "Noel"

let lastName: String? = "Bansikah"


if let firstName = firstName,
   let lastName = lastName {

    print(
        "Full name: \(firstName) \(lastName)"
    )
}


// Both values must exist for the block to run.



// ======================================================
// 8. OPTIONAL BINDING + CONDITION
// ======================================================
//
// We can unwrap a value and then check another
// condition.

let age: Int? = 25


if let age = age,
   age >= 18 {

    print("User is an adult")
}


// This means:
//
// 1. Does age exist?
// 2. If yes, is age >= 18?



// ======================================================
// 9. GUARD LET
// ======================================================
//
// guard let is extremely useful in functions.
//
// It means:
//
// "If this value doesn't exist, leave this scope."

func greetUser(name: String?) {

    guard let name = name else {

        print("No name provided")

        return
    }

    print(
        "Hello, \(name)"
    )
}


greetUser(name: "Noel")

greetUser(name: nil)



// ======================================================
// 10. if let VS guard let
// ======================================================
//
// if let:
//
//     Use the value inside the if block.
//
// guard let:
//
//     Make sure the value exists,
//     then continue with the function.
//
//
//
// Example:
//
// if let:
//
//     if let user = user {
//         print(user)
//     }
//
//
//
// guard:
//
//     guard let user = user else {
//         return
//     }
//
//     print(user)
//
//
//
// guard is especially useful when you want to avoid
// deeply nested code.



// ======================================================
// 11. NIL-COALESCING OPERATOR
// ======================================================
//
// The operator:
//
//     ??
//
// means:
//
// "Use this value if it exists,
// otherwise use this default."

let nickname: String? = nil


let displayName = nickname ?? "Guest"


print(displayName)

// Output:
//
// Guest


// If nickname were:
//
// let nickname: String? = "Noel"
//
// Then:
//
// displayName
//
// would be:
//
// Noel



// ======================================================
// 12. PRACTICAL EXAMPLE OF ??
// ======================================================

let username2: String? = nil

let welcomeMessage =
    "Welcome, \(username2 ?? "Guest")"


print(welcomeMessage)

// Output:
//
// Welcome, Guest



// ======================================================
// 13. OPTIONAL CHAINING
// ======================================================
//
// Optional chaining allows you to safely access
// properties and methods of an optional.
//
// Use:
//
//     ?.
//
// Example:

struct User {

    let name: String

    func greet() {

        print(
            "Hello, \(name)"
        )
    }
}


let user: User? = User(
    name: "Noel"
)


user?.greet()


// If user exists:
//
// Hello, Noel
//
// If user is nil:
//
// Nothing happens.



// ======================================================
// 14. OPTIONAL CHAINING WITH PROPERTIES
// ======================================================

let userName = user?.name

print(userName)


// userName is:
//
// String?
//
// because user might be nil.



// ======================================================
// 15. OPTIONAL CHAINING MULTIPLE LEVELS
// ======================================================

struct Address {

    let city: String
}


struct Person {

    let address: Address?
}


let person: Person? = Person(
    address: Address(
        city: "Douala"
    )
)


let city = person?.address?.city


print(city)


// The result is:
//
// String?
//
// because any level of the chain might be nil.



// ======================================================
// 16. FORCE UNWRAPPING
// ======================================================
//
// The ! operator forces Swift to unwrap an optional.
//
// Example:

let country: String? = "Cameroon"

print(country!)


// This works because country contains a value.
//
// BUT:
//
// Force unwrapping is dangerous.



// ======================================================
// 17. FORCE UNWRAPPING A NIL VALUE
// ======================================================
//
// This will crash:
//
// let country: String? = nil
//
// print(country!)
//
// Runtime error:
//
// Fatal error: Unexpectedly found nil while
// unwrapping an Optional value.
//
//
//
// Therefore:
//
// Avoid ! unless you are absolutely certain
// the value cannot be nil.



// ======================================================
// 18. OPTIONAL CASTING WITH as?
// ======================================================
//
// When converting between types, you may not know
// whether the conversion will succeed.
//
// Swift can safely return nil.
//
// Example:

let value: Any = "Hello"


let text = value as? String


print(text)


// text is:
//
// String?
//
// because the cast might fail.



// ======================================================
// 19. as? VS as!
// ======================================================
//
// Safe cast:
//
//     as?
//
// If conversion fails:
//
//     nil
//
//
//
// Forced cast:
//
//     as!
//
// If conversion fails:
//
//     program crashes
//
//
//
// Prefer:
//
//     as?
//
// unless you're completely certain.



// ======================================================
// 20. OPTIONAL FUNCTION RETURN VALUES
// ======================================================
//
// A function can return an optional.
//
// This is useful when a function might not find
// or produce a value.

func findUser() -> String? {

    return nil
}


let result = findUser()


if let result = result {

    print(
        "Found user: \(result)"
    )

} else {

    print(
        "User not found"
    )
}



// ======================================================
// 21. PRACTICAL SEARCH EXAMPLE
// ======================================================

let users = [
    "Noel",
    "Taylor",
    "John"
]


func findUser(
    name: String
) -> String? {

    for user in users {

        if user == name {

            return user
        }
    }

    return nil
}


if let user = findUser(
    name: "Noel"
) {

    print(
        "Found: \(user)"
    )
} else {

    print("User not found")
}



// ======================================================
// 22. OPTIONALS WITH ARRAYS
// ======================================================
//
// Array indexes can be dangerous.
//
// Swift's Array subscript normally crashes if you use
// an invalid index.
//
// We can create a safe helper using an extension.

extension Array {

    subscript(safe index: Int) -> Element? {

        guard indices.contains(index) else {

            return nil
        }

        return self[index]
    }
}


let numbers = [
    10,
    20,
    30
]


print(numbers[safe: 0])
print(numbers[safe: 10])


// Output:
//
// Optional(10)
// nil



// ======================================================
// 23. OPTIONAL MAP
// ======================================================
//
// map() allows you to transform an optional value
// without manually writing if let.
//
// Example:

let number: Int? = 10


let doubled = number.map {
    $0 * 2
}


print(doubled)

// Output:
//
// Optional(20)
//
// If number were nil:
//
// doubled would also be nil.



// ======================================================
// 24. OPTIONAL FLATMAP
// ======================================================
//
// flatMap is useful when the transformation itself
// returns an optional.
//
// Example:

let input: String? = "25"


let convertedNumber = input.flatMap {
    Int($0)
}


print(convertedNumber)


// convertedNumber is:
//
// Int?
//
// If the String cannot be converted:
//
// nil



// ======================================================
// 25. OPTIONALS WITH readLine()
// ======================================================
//
// You have already seen this when learning Swift.
//
// readLine() returns:
//
// String?
//
// Why?
//
// Because the user might not provide input.

if let input = readLine() {

    print(
        "You entered: \(input)"
    )
}


// This is why you often see:
//
// if let input = readLine() {
//
// }



// ======================================================
// 26. OPTIONAL INPUT + INT CONVERSION
// ======================================================
//
// This is a very common Swift pattern.

if let input = readLine(),
   let number = Int(input) {

    print(
        "You entered number \(number)"
    )

} else {

    print(
        "Invalid input"
    )
}


// There are TWO possible failures:
//
// 1. readLine() could return nil.
//
// 2. Int(input) could return nil.
//
// Swift makes us handle both.



// ======================================================
// 27. YOUR WORKING DAYS EXAMPLE
// ======================================================
//
// This connects directly to the exercise you did
// earlier with enums.

enum WorkingDay: Int {

    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
}


print("Select a working day (1-5):")


if let input = readLine(),
   let number = Int(input),
   let selectedDay = WorkingDay(
       rawValue: number
   ) {

    switch selectedDay {

    case .monday:
        print("Start the week strong!")

    case .tuesday:
        print("Keep the momentum!")

    case .wednesday:
        print("Halfway there!")

    case .thursday:
        print("Almost Friday!")

    case .friday:
        print("Weekend is coming!")
    }

} else {

    print(
        "Invalid working day. Please choose 1-5."
    )
}


// Notice how many optionals we handled:
//
// readLine()
//     ↓
// String?
//
// Int(input)
//     ↓
// Int?
//
// WorkingDay(rawValue: number)
//     ↓
// WorkingDay?
//
// Optional binding safely unwraps all of them.



// ======================================================
// 28. IMPLICITLY UNWRAPPED OPTIONALS
// ======================================================
//
// You may see:
//
// String!
//
// Example:

var username3: String! = "Noel"


print(username3)


// This is called an:
//
// Implicitly Unwrapped Optional
//
// It behaves somewhat like an optional but can be
// accessed without manually unwrapping it.
//
//
//
// IMPORTANT:
//
// You generally should not use these casually.
//
// They are mostly useful in specific situations,
// especially some UIKit / initialization scenarios.
//
// Prefer normal:
//
// String?
//
// when a value can genuinely be nil.



// ======================================================
// 29. OPTIONAL DEFAULT VALUES
// ======================================================
//
// You can combine optionals with default values.

func getUsername(
    username: String?
) -> String {

    return username ?? "Guest"
}


print(
    getUsername(username: "Noel")
)

print(
    getUsername(username: nil)
)



// ======================================================
// 30. OPTIONALS WITH GUARD IN A REAL FUNCTION
// ======================================================

struct Account {

    let username: String
    let email: String
}


func login(
    account: Account?
) {

    guard let account = account else {

        print(
            "Cannot login. Account does not exist."
        )

        return
    }

    print(
        "Logging in \(account.username)"
    )

    print(
        "Email: \(account.email)"
    )
}


let account = Account(
    username: "Noel",
    email: "noel@example.com"
)


login(account: account)

login(account: nil)



// ======================================================
// 31. OPTIONALS + CLASSES
// ======================================================
//
// References can also be optional.

class UserManager {

    var currentUser: String?

    func login(
        username: String
    ) {

        currentUser = username
    }

    func logout() {

        currentUser = nil
    }
}


let manager = UserManager()


print(manager.currentUser)

// nil


manager.login(
    username: "Noel"
)


print(manager.currentUser)

// Optional("Noel")


manager.logout()

print(manager.currentUser)

// nil



// ======================================================
// 32. COMMON OPTIONAL PATTERNS
// ======================================================
//
// PATTERN 1:
//
// if let

if let value = optionalValue {
    print(value)
}


//
//
// PATTERN 2:
//
// guard let

// guard let value = optionalValue else {
//     return
// }
//
// print(value)



// PATTERN 3:
//
// nil coalescing

// let value = optionalValue ?? defaultValue



// PATTERN 4:
//
// optional chaining

// optionalObject?.property
// optionalObject?.method()



// PATTERN 5:
//
// force unwrap

// optionalValue!
//
// Use carefully.



// ======================================================
// 33. WHAT DOES "UNWRAP" MEAN?
// ======================================================
//
// Suppose:
//
// let name: String? = "Noel"
//
// The type is:
//
// Optional<String>
//
// not:
//
// String
//
//
//
// Swift won't automatically treat it as a String.
//
//
// Unwrapping means:
//
// "I have checked that the optional contains
// a value. Give me the actual value."


//
// Example:
//
// if let name = name {
//
//     // name is now String
//
// }



// ======================================================
// 34. OPTIONAL MENTAL MODEL
// ======================================================
//
// Imagine an optional as a box:
//
//
//
// String?
//
// ┌─────────────────────┐
// │                     │
// │      "Noel"         │
// │                     │
// └─────────────────────┘
//
//
// OR:
//
// ┌─────────────────────┐
// │                     │
// │        nil          │
// │                     │
// └─────────────────────┘
//
//
//
// Swift forces you to check which situation
// you're dealing with before safely using the value.



// ======================================================
// FINAL SUMMARY
// ======================================================
//
//
// OPTIONAL:
//
//     String?
//
//     Value OR nil
//
//
//
// OPTIONAL BINDING:
//
//     if let
//
//     Safely unwrap an optional.
//
//
//
// GUARD:
//
//     guard let
//
//     Unwrap and exit early if nil.
//
//
//
// NIL COALESCING:
//
//     ??
//
//     Provide a default value.
//
//
//
// OPTIONAL CHAINING:
//
//     ?.
//
//     Safely access properties/methods.
//
//
//
// FORCE UNWRAPPING:
//
//     !
//
//     Force the value out.
//
//     Dangerous if nil.
//
//
//
// SAFE CAST:
//
//     as?
//
//     Returns nil if conversion fails.
//
//
//
// FORCED CAST:
//
//     as!
//
//     Crashes if conversion fails.
//
//
//
// OPTIONAL RETURN:
//
//     func findUser() -> User?
//
//     Useful when a function might not find a value.
//
//
//
// ======================================================
//
// MOST IMPORTANT RULE:
//
// Prefer safe handling:
//
//     if let
//     guard let
//     ??
//     ?.
//
//
//
// Be careful with:
//
//     !
//     as!
//
//
//
// ======================================================
//
// FINAL MENTAL MODEL:
//
//
// Optional
//     ↓
// "The value might not exist."
//
//     ↓
//
// Check / unwrap
//
//     ├── Value exists
//     │      ↓
//     │   Use the value
//     │
//     └── nil
//            ↓
//        Handle the missing value
//
// ======================================================
