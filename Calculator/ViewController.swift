import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
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
                // If the user hasn't finished typing a number, append the current button's title to the display label
                displayLabel.text = displayLabel.text! + numValue
            }
        }
        
    }
}

