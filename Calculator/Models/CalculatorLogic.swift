import Foundation
// Define a structure named CalculatorLogic
struct CalculatorLogic {
    // private Tuple to store the value and the type of operation
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    // mutating Method for processing calculations based on display text and operation method
    mutating func processCalculation(displayText: String?, calcMethod: String?) -> String {
        // Use optional binding to safely attempt conversion of display text to a Double
        guard let number = Double(displayText ?? "0") else {
            // If conversion fails, terminate the program and print an error message
            fatalError("Cannot convert display label text to a Double")
        }
        // Switch statement to handle different calculation methods
        switch calcMethod {
        case "+/-":
            // Change the sign of the number and return as a string
            return String(number * -1)
        case "AC":
            // Clear intermediate calculation and reset to 0
            intermediateCalculation = nil
            return "0"
        case "%":
            // Convert the number to a percentage and return as a string
            return String(number * 0.01)
        case "+", "-", "×", "÷":
            // Store the current number and operation for later use
            intermediateCalculation = (n1: number, calcMethod: calcMethod!)
            // Return the current display text as the updated result
            return displayText ?? "0"
        case "=":
            // Perform the two-number calculation and return the result as a string
            if let intermediateCalculation = intermediateCalculation {
                return String(performTwoNumCalculation(n2: number, calculation: intermediateCalculation))
            } else {
                // If there's no intermediate calculation, return the current display text or "0" if nil
                return displayText ?? "0"
            }
        default:
            // Return the original display text if no specific calculation is needed
            return displayText ?? "0"
        }
    }
    // Function to perform a two-number calculation based on the stored operation
    private func performTwoNumCalculation(n2: Double, calculation: (n1: Double, calcMethod: String)) -> Double {
        // Extract values from the tuple
        let n1 = calculation.n1
        let operation = calculation.calcMethod
        // Switch statement to perform different calculations based on the operation
        switch operation {
        case "+":
            // Addition
            return n1 + n2
        case "-":
            // Subtraction
            return n1 - n2
        case "×":
            // Multiplication
            return n1 * n2
        case "÷":
            // Division
            return n1 / n2
        default:
            // Handle unsupported operations by terminating the program
            fatalError("Unsupported operation")
        }
    }
    // Method for processing number buttons based on the given numeric value, typing state, and current display text
    func processNumberButton(numValue: String, isFinishedTyping: Bool, currentDisplayText: String) -> String {
        // Check if the user has finished typing a number
        if isFinishedTyping {
            // If yes, set the display text to the current numeric value
            return numValue
        } else {
            // If the user is still typing, handle special cases for decimal points
            if numValue == "." {
                // Try to convert the current display label text to a Double
                guard let currentDisplayValue = Double(currentDisplayText) else {
                    // If conversion fails, terminate the program and print an error message
                    fatalError("Cannot convert display label text to a Double")
                }
                // Check if the current display value is an integer (has no decimal part)
                let isInt = currentDisplayValue.truncatingRemainder(dividingBy: 1) == 0
                if !isInt {
                    // If not an integer, return the current display text to avoid adding decimals
                    return currentDisplayText
                }
            }
            // If none of the special cases apply, append the current numeric value to the display text
            return currentDisplayText + numValue
        }
    }
}
