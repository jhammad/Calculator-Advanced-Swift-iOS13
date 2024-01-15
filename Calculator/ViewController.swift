import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        // make sure that is always a number on display
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
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
                    // Try to convert the current display label text to a Double
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        // If conversion fails, print an error message and terminate the program
                        fatalError("Cannot convert display label text to a Double")
                    }
                    // Check if the current display value is an integer (has no decimal part)
                    let isInt = floor(currentDisplayValue) == Double(displayLabel.text!)
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

