//
//  AddEditTableViewController.swift
//  EmojiDIctionary
//
//  Created by Rohit Jangid on 13/10/20.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var emoji: Emoji?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
    }

    func updateSaveButtonState() {
        guard let symbolText = symbolTextField.text, let nameText = nameTextField.text, let descriptionText = descriptionTextField.text, let usageText = usageTextField.text else { return }
        saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        guard let symbolText = symbolTextField.text, let nameText = nameTextField.text, let descriptionText = descriptionTextField.text, let usageText = usageTextField.text else { return }
        emoji = Emoji(symbol: symbolText, name: nameText, description: descriptionText, usage: usageText)
    }

}
