import Foundation

// ======================================================
// SWIFT GUARD - UNWRAPPING OPTIONALS
// ======================================================
//
// guard is used when something MUST be valid before
// the rest of your code can continue.
//
// The most common pattern is:
//
// guard let value = optionalValue else {
//
//     // Handle the missing value
//     // and EXIT the current scope.
//
//     return
// }
//
// After the guard:
//
// value is safely unwrapped.
//
// ======================================================



// ======================================================
// 1. BASIC guard let
// ======================================================

let name: String? = "Noel"


guard let unwrappedName = name else {

    print("Name is missing")

    // guard requires us to leave the current scope.
    //
    // At the top level, use of guard can be awkward
    // depending on the Swift environment, so this
    // example is better understood inside a function.
    
    fatalError("No name")
}


print(unwrappedName)



// ======================================================
// 2. THE MOST COMMON USE: FUNCTIONS
// ======================================================
//
// guard is especially useful inside functions.
//
// If the optional is nil:
//
//     exit the function
//
// If the optional contains a value:
//
//     continue normally.

func greetUser(name: String?) {

    guard let name = name else {

        print("No name was provided")

        return
    }

    // From this point onward,
    // name is a normal String.

    print("Hello, \(name)")
}


greetUser(name: "Noel")

greetUser(name: nil)



// ======================================================
// 3. WHY guard IS USEFUL
// ======================================================
//
// Without guard:
//
// if let name = name {
//
//     print("Hello, \(name)")
//
// } else {
//
//     print("No name")
// }
//
//
//
// With guard:
//
// guard let name = name else {
//
//     print("No name")
//     return
// }
//
// print("Hello, \(name)")
//
//
//
// guard allows the main logic to remain outside
// of a nested if block.



// ======================================================
// 4. guard CREATES A VALUE AVAILABLE AFTERWARD
// ======================================================

func printName(name: String?) {

    guard let name = name else {

        print("Name is missing")

        return
    }

    // name is available here.

    print("Name: \(name)")
    print("Characters: \(name.count)")
}


printName(name: "Noel")



// ======================================================
// 5. guard WITH MULTIPLE OPTIONALS
// ======================================================
//
// You can unwrap multiple optionals in one guard.

func createUser(
    firstName: String?,
    lastName: String?
) {

    guard let firstName = firstName,
          let lastName = lastName else {

        print("First name or last name is missing")

        return
    }

    print(
        "User: \(firstName) \(lastName)"
    )
}


createUser(
    firstName: "Noel",
    lastName: "Bansikah"
)


createUser(
    firstName: nil,
    lastName: "Bansikah"
)



// ======================================================
// 6. guard WITH OPTIONAL + CONDITION
// ======================================================
//
// guard can do more than unwrap.
//
// You can also validate the value.

func checkAge(age: Int?) {

    guard let age = age,
          age >= 18 else {

        print(
            "User is either under 18 or age is missing."
        )

        return
    }

    print(
        "User is \(age) years old and is an adult."
    )
}


checkAge(age: 25)

checkAge(age: 15)

checkAge(age: nil)



// ======================================================
// 7. guard WITH STRINGS
// ======================================================
//
// A common real-world situation:
//
// User enters an empty string.

func processUsername(
    username: String?
) {

    guard let username = username,
          !username.isEmpty else {

        print(
            "Username cannot be empty."
        )

        return
    }

    print(
        "Processing username: \(username)"
    )
}


processUsername(
    username: "Noel"
)

processUsername(
    username: ""
)

processUsername(
    username: nil



// ======================================================
// 8. guard WITH readLine()
// ======================================================
//
// You have already used readLine().
//
// Remember:
//
// readLine() -> String?
//
// Because input may not exist.

func readUserName() {

    print("Enter your name:")

    guard let input = readLine() else {

        print("No input received.")

        return
    }

    print(
        "Hello, \(input)"
    )
}


// readUserName()



// ======================================================
// 9. guard WITH readLine() AND Int
// ======================================================
//
// This is very useful for command-line programs.
//
// readLine()
//     ↓
// String?
//
// Int(input)
//     ↓
// Int?

func readAge() {

    print("Enter your age:")

    guard let input = readLine(),
          let age = Int(input) else {

        print(
            "Please enter a valid number."
        )

        return
    }

    print(
        "Your age is \(age)"
    )
}


// readAge()



// ======================================================
// 10. YOUR WORKING DAYS EXAMPLE WITH guard
// ======================================================
//
// Let's improve the exercise you previously wrote.

enum WorkingDay: Int {

    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
}


func selectWorkingDay() {

    print(
        "Select a working day (1-5):"
    )

    // Step 1:
    // Make sure input exists.

    guard let input = readLine() else {

        print("No input received.")

        return
    }


    // Step 2:
    // Make sure input can be converted to Int.

    guard let number = Int(input) else {

        print(
            "Please enter a number."
        )

        return
    }


    // Step 3:
    // Make sure number represents a WorkingDay.

    guard let selectedDay = WorkingDay(
        rawValue: number
    ) else {

        print(
            "Please select a number from 1 to 5."
        )

        return
    }


    // At this point all validation succeeded.
    //
    // selectedDay is now a normal WorkingDay,
    // not WorkingDay?.

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
}


// Uncomment to run:
//
// selectWorkingDay()



// ======================================================
// 11. MULTIPLE guard CHECKS VS ONE guard
// ======================================================
//
// You can write:

func example1(
    name: String?,
    age: Int?
) {

    guard let name = name else {

        print("Name missing")

        return
    }

    guard let age = age else {

        print("Age missing")

        return
    }

    print(
        "\(name) is \(age) years old."
    )
}


// Or combine them:

func example2(
    name: String?,
    age: Int?
) {

    guard let name = name,
          let age = age else {

        print("Name or age missing")

        return
    }

    print(
        "\(name) is \(age) years old."
    )
}


// Both approaches are valid.
//
// Use separate guards when you want more specific
// error messages.
//
// Use one guard when the failure can be handled
// in the same way.



// ======================================================
// 12. guard let WITH OPTIONAL CHAINING
// ======================================================

struct Address {

    let city: String
}


struct User {

    let name: String
    let address: Address?
}


func showUserCity(
    user: User?
) {

    guard let user = user,
          let city = user.address?.city else {

        print(
            "User or city information is missing."
        )

        return
    }

    print(
        "\(user.name) lives in \(city)."
    )
}


let user = User(
    name: "Noel",
    address: Address(
        city: "Douala"
    )
)


showUserCity(user: user)

showUserCity(user: nil)



// ======================================================
// 13. guard let WITH DICTIONARIES
// ======================================================
//
// Dictionary lookups return optionals.
//
// Example:
//
// dictionary["name"]
//
// gives:
//
// String?
//
// if the dictionary contains String values.

let person: [String: Any] = [

    "name": "Noel",

    "age": 25
]


func displayPerson(
    person: [String: Any]
) {

    guard let name = person["name"] as? String else {

        print("Name is missing or invalid.")

        return
    }

    guard let age = person["age"] as? Int else {

        print("Age is missing or invalid.")

        return
    }

    print(
        "Name: \(name), Age: \(age)"
    )
}


displayPerson(person: person)



// ======================================================
// 14. guard WITH ARRAY SEARCH
// ======================================================
//
// Methods such as first(where:) return optionals.
//
// Why?
//
// Because the item might not exist.

let users = [
    "Noel",
    "Taylor",
    "John"
]


func findUser(
    name: String
) {

    guard let user = users.first(
        where: { $0 == name }
    ) else {

        print(
            "User \(name) was not found."
        )

        return
    }

    print(
        "Found user: \(user)"
    )
}


findUser(name: "Noel")

findUser(name: "Peter")



// ======================================================
// 15. guard WITH FUNCTIONS THAT RETURN VALUES
// ======================================================
//
// guard can also be used when a function needs
// to return a value.

func getUsername(
    username: String?
) -> String {

    guard let username = username else {

        return "Guest"
    }

    return username
}


print(
    getUsername(username: "Noel")
)

print(
    getUsername(username: nil)
)



// ======================================================
// 16. guard DOES NOT ALWAYS USE return
// ======================================================
//
// The important rule is:
//
// guard's else block MUST leave the current scope.
//
// You can use:
//
// return
//
// throw
//
// break
//
// continue
//
// or another statement that never returns,
// such as fatalError().
//
//
//
// Example with throw:

enum LoginError: Error {

    case missingUsername
}


func login(
    username: String?
) throws {

    guard let username = username else {

        throw LoginError.missingUsername
    }

    print(
        "Logging in \(username)"
    )
}


// This example introduces error handling,
// which you can learn separately later.



// ======================================================
// 17. guard WITH LOOP
// ======================================================
//
// guard can also use:
//
// continue
//
// inside a loop.

let numbers = [
    10,
    -5,
    20,
    -2,
    30
]


for number in numbers {

    guard number >= 0 else {

        print(
            "Skipping negative number: \(number)"
        )

        continue
    }

    print(
        "Processing: \(number)"
    )
}



// ======================================================
// 18. guard VS if let
// ======================================================
//
// IF LET:
//
// if let name = name {
//
//     // Work with name
//
// } else {
//
//     // Handle nil
//
// }
//
//
//
// GUARD:
//
// guard let name = name else {
//
//     // Handle nil
//     return
// }
//
// // Work with name
//
//
//
// The biggest difference:
//
// if let
//     ↓
// The successful value is mainly used
// inside the if block.
//
//
// guard let
//     ↓
// The successful value remains available
// for the rest of the current scope.



// ======================================================
// 19. NESTED if LET
// ======================================================
//
// Code can become difficult to read:
//
// func processUser(
//     name: String?,
//     age: Int?
// ) {
//
//     if let name = name {
//
//         if let age = age {
//
//             if age >= 18 {
//
//                 print(
//                     "\(name) is an adult."
//                 )
//             }
//         }
//     }
// }


// guard lets us flatten the code.

func processUser(
    name: String?,
    age: Int?
) {

    guard let name = name,
          let age = age,
          age >= 18 else {

        print(
            "Invalid user information."
        )

        return
    }

    print(
        "\(name) is an adult."
    )
}



// ======================================================
// 20. REALISTIC LOGIN EXAMPLE
// ======================================================
//
// This is where guard becomes extremely useful.

struct LoginUser {

    let username: String
    let password: String
}


func login(
    username: String?,
    password: String?
) {

    // Validate username.

    guard let username = username,
          !username.isEmpty else {

        print(
            "Username is required."
        )

        return
    }


    // Validate password.

    guard let password = password,
          !password.isEmpty else {

        print(
            "Password is required."
        )

        return
    }


    // Everything is valid.

    print(
        "Logging in \(username)..."
    )

    print(
        "Password accepted."
    )
}


login(
    username: "Noel",
    password: "12345"
)


login(
    username: nil,
    password: "12345"
)


login(
    username: "Noel",
    password: nil
)



// ======================================================
// 21. REALISTIC API-STYLE EXAMPLE
// ======================================================
//
// Imagine a function receives data from an API.
//
// Some information might be missing.

struct APIUser {

    let name: String
    let email: String
}


func processUser(
    name: String?,
    email: String?
) -> APIUser? {

    guard let name = name,
          !name.isEmpty else {

        print(
            "Invalid name."
        )

        return nil
    }


    guard let email = email,
          !email.isEmpty else {

        print(
            "Invalid email."
        )

        return nil
    }


    return APIUser(
        name: name,
        email: email
    )
}


if let user = processUser(
    name: "Noel",
    email: "noel@example.com"
) {

    print(
        "Created user: \(user.name)"
    )
}



// ======================================================
// 22. guard + DEFAULT VALUES
// ======================================================
//
// Sometimes you don't need guard.
//
// If a default value is acceptable,
// use:
//
//     ??
//
// Example:

func displayName(
    name: String?
) {

    let finalName = name ?? "Guest"

    print(
        "Welcome \(finalName)"
    )
}


displayName(name: "Noel")

displayName(name: nil)


// Use:
//
// guard
//
// when the value is REQUIRED.
//
// Use:
//
// ??
//
// when a fallback is acceptable.



// ======================================================
// 23. WHEN SHOULD YOU PREFER guard?
// ======================================================
//
// Use guard when:
//
// ✓ A value is required.
//
// ✓ The function cannot continue without it.
//
// ✓ You want early validation.
//
// ✓ You want to avoid nested if statements.
//
// ✓ You want the unwrapped value available
//   throughout the rest of the scope.
//
//
//
// Example:
//
// guard let user = user else {
//     return
// }
//
// continue processing user...



// ======================================================
// 24. WHEN SHOULD YOU PREFER if let?
// ======================================================
//
// Use if let when:
//
// ✓ The optional value is only needed for a
//   small section of code.
//
// ✓ Both the success and failure paths are meaningful.
//
//
//
// Example:

let nickname: String? = "Noel"


if let nickname = nickname {

    print(
        "Nickname: \(nickname)"
    )
}


// The rest of the code doesn't need nickname.



// ======================================================
// 25. WHEN SHOULD YOU PREFER ??
// ======================================================
//
// Use ?? when:
//
// ✓ A sensible default exists.
//
// Example:

let name = nickname ?? "Guest"


// "Guest" is a reasonable fallback.
//
// No need for guard.



// ======================================================
// 26. THE GOLDEN RULE
// ======================================================
//
// Ask yourself:
//
// "Can the function continue without this value?"
//
// If NO:
//
//     guard let
//
// If YES, and you have a default:
//
//     ??
//
// If YES, and you only want to use it temporarily:
//
//     if let
//
//
//
// Example:
//
// User must exist:
//
//     guard let user = user else {
//         return
//     }
//
//
//
// Username can default:
//
//     let name = username ?? "Guest"
//
//
//
// Optional feature:
//
//     if let profileImage = image {
//         show(profileImage)
//     }



// ======================================================
// 27. COMMON MISTAKE
// ======================================================
//
// This is NOT valid:
//
// guard let name = name
//
// You MUST provide an else:
//
// guard let name = name else {
//
//     return
// }
//
//
//
// Why?
//
// Because guard's whole purpose is:
//
// "If the condition fails,
// exit this scope."



// ======================================================
// 28. COMMON MISTAKE: USING guard AT TOP LEVEL
// ======================================================
//
// guard is designed for a scope such as:
//
// - functions
// - loops
// - other control-flow scopes
//
// For learning, put your guard logic inside
// functions.
//
// Example:

func example() {

    let name: String? = "Noel"

    guard let name = name else {

        return
    }

    print(name)
}


example()



// ======================================================
// 29. PRACTICAL COMPLETE EXAMPLE
// ======================================================
//
// Let's combine:
//
// - Optional
// - guard let
// - validation
// - enum
// - switch
// - function
// - readLine()

enum WorkingDay: Int {

    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
}


func selectWorkingDay() {

    print(
        "Select a working day (1-5):"
    )


    // --------------------------------------------------
    // Make sure input exists.
    // --------------------------------------------------

    guard let input = readLine() else {

        print(
            "No input received."
        )

        return
    }


    // --------------------------------------------------
    // Convert String to Int.
    // --------------------------------------------------

    guard let number = Int(input) else {

        print(
            "Please enter a valid number."
        )

        return
    }


    // --------------------------------------------------
    // Convert number to WorkingDay.
    // --------------------------------------------------

    guard let selectedDay = WorkingDay(
        rawValue: number
    ) else {

        print(
            "Please select a number from 1 to 5."
        )

        return
    }


    // --------------------------------------------------
    // At this point everything is valid.
    // --------------------------------------------------

    switch selectedDay {

    case .monday:
        print(
            "Start the week strong!"
        )

    case .tuesday:
        print(
            "Keep the momentum!"
        )

    case .wednesday:
        print(
            "Halfway there!"
        )

    case .thursday:
        print(
            "Almost Friday!"
        )

    case .friday:
        print(
            "Weekend is coming!"
        )
    }
}


// Call the function:
//
// selectWorkingDay()



// ======================================================
// FINAL SUMMARY
// ======================================================
//
//
// guard let:
//
//     Safely unwraps an optional.
//
//
//
// BASIC STRUCTURE:
//
// guard let value = optionalValue else {
//
//     // Handle failure
//
//     return
// }
//
// // value is available here.
//
//
//
// MULTIPLE VALUES:
//
// guard let name = name,
//       let age = age else {
//
//     return
// }
//
//
//
// WITH CONDITIONS:
//
// guard let age = age,
//       age >= 18 else {
//
//     return
// }
//
//
//
// WITH readLine:
//
// guard let input = readLine() else {
//
//     return
// }
//
//
//
// WITH CONVERSION:
//
// guard let input = readLine(),
//       let number = Int(input) else {
//
//     return
// }
//
//
//
// ======================================================
//
// MENTAL MODEL:
//
//
//
// Optional
//     ↓
// "Maybe there is a value."
//
//     ↓
//
// guard let
//
//     ┌───────────────────┐
//     │                   │
//     ▼                   ▼
//   Value               nil
//     │                   │
//     │                   └──→ exit scope
//     │
//     ▼
// Continue safely
//
// ======================================================
//
//
//
// THE MAIN IDEA:
//
// guard is an EARLY EXIT mechanism.
//
// It lets you say:
//
// "Before I continue, this MUST be valid."
//
// If it isn't:
//
// "Stop here."
//
// ======================================================
