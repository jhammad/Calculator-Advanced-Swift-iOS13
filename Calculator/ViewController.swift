import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    // Define a computed property named displayValue of type Double
    private var displayValue: Double {
        // Getter for the displayValue property
        get {
            // Use guard to safely unwrap and convert displayLabel.text to a Double
            guard let number = Double(displayLabel.text!) else {
                // If the conversion fails, trigger a fatal error with an informative message
                fatalError("Cannot convert display label text to a Double")
            }
            // Return the successfully converted number
            return number
        }
        // Setter for the displayValue property
        set {
            // Update displayLabel.text with the string representation of the new value
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayValue *= -1
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        // Check if the sender has a current title (text on a button, for example)
        if let numValue = sender.currentTitle {
            // Check if the user has finished typing a number
            if isFinishedTypingNumber {
                // If yes, set the display label to the current button's title
                displayLabel.text = numValue
                // Update the var to indicate that a number is being typed
                isFinishedTypingNumber = false
            }
            else {
                
                // Check if the button pressed corresponds to the decimal point (".")
                if numValue == "." {
                    // Check if the current display value is an integer (has no decimal part)
                    let isInt = floor(displayValue) == displayValue
                    // If the current value is not an integer (has a decimal part), return from the function
                    //to avoid adding decimals
                    if !isInt {
                        return
                    }
                }
                
                // If the user hasn't finished typing a number, append the current button's title to the display label
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

