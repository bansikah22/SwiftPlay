// Noel Bansikah 06/08/2026

import Foundation

let age = 20
let temperature = 30
let score = 75

let ageStatus = age >= 18 ? "Adult" : "Minor"

let weather = temperature > 25 ? "Hot" : "Cold"

let passed = score >= 50 ? "Pass" : "Fail"

print("Age Status : \(ageStatus)")
print("Weather    : \(weather)")
print("Result     : \(passed)")

// 07/08/2026
// 2D arrays

var grid = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
print(grid[0][1]) // 2
for row in grid {
  print(row)
}
