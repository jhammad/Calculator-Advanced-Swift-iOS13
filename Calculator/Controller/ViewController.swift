import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    // private var to check if the typing is over 
    private var isFinishedTypingNumber: Bool = true
    //private var to use the Model CalculatorLogic
    private var calculartorLogic = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // Mark that the user has finished typing a number
        isFinishedTypingNumber = true
        // Get the current text on the display label
        let displayText = displayLabel.text
        // Call the processCalculation method from the CalculatorLogic class
        // This method takes the current display text and the title of the pressed button
        let result = calculartorLogic.processCalculation(displayText: displayText, calcMethod: sender.currentTitle)
        // Update the display label with the result of the calculation
        displayLabel.text = result
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        // Check if the sender has a current title (text on a button, for example)
        if let numValue = sender.currentTitle {
            // Call the processNumberButton method from the CalculatorLogic class
            // This method takes the current button's title, whether the user has finished typing a number,
            // and the current text on the display label
            let updatedText = calculartorLogic.processNumberButton(numValue: numValue, isFinishedTyping: isFinishedTypingNumber, currentDisplayText: displayLabel.text ?? "")
            // Update the display label with the result of the processNumberButton method
            displayLabel.text = updatedText
            // Mark that the user is currently typing a number
            isFinishedTypingNumber = false
        }
    }
}

