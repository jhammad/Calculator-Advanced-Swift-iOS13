import Foundation // not necessary to import UIKit beacuse the UI will be handled by the ViewController

// Define a class called CalculatorLogic
class CalculatorLogic {
    // Method named processCalculation that takes two optional parameters: displayText and calcMethod. The -> String part indicates that the method will return a String value.
    func processCalculation(displayText: String?, calcMethod: String?) -> String {
        // Use optional binding to safely attempt conversion of display text to a Double
        guard let number = Double(displayText ?? "0") else {
            // If conversion fails, terminate the program and print an error message
            fatalError("Cannot convert display label text to a Double")
        }
        print("Successfully converted display text to a Double: \(number)")
        // Switch statement to handle different calculation methods
        switch calcMethod {
        case "+/-":
            return String(number * -1)  // Change the sign of the number
        case "AC":
            return "0"  // Reset to 0
        case "%":
            return String(number * 0.01)  // Convert to percentage
        default:
            return displayText ?? "0"  // Return the original display text if no specific calculation is needed
        }
    }
    // Method for processing number buttons based on the given numeric value, typing state, and current display text
    func processNumberButton(numValue: String, isFinishedTyping: Bool, currentDisplayText: String) -> String {
        // Check if the user has finished typing a number
        if isFinishedTyping {
            return numValue  // If yes, set the display text to the current numeric value
        } else {
            // If the user is still typing, handle special cases for decimal points
            if numValue == "." {
                // Try to convert the current display label text to a Double
                guard let currentDisplayValue = Double(currentDisplayText) else {
                    // If conversion fails, terminate the program and print an error message
                    fatalError("Cannot convert display label text to a Double")
                }
                // Check if the current display value is an integer (has no decimal part)
                let isInt = floor(currentDisplayValue) == Double(currentDisplayText)
                if !isInt {
                    return currentDisplayText  // If not an integer, return the current display text to avoid adding decimals
                }
            }
            // If none of the special cases apply, append the current numeric value to the display text
            return currentDisplayText + numValue
        }
    }
}

