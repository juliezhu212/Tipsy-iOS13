//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var eachPerson: Double?
    var tip = 0.1
    var numberOfPeople = 2.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Deselect all buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Highlight sender button
        sender.isSelected = true
        
        // Change tip by sender button
        switch sender {
        case zeroPctButton:
            tip = 0
        case tenPctButton:
            tip = 0.1
        case twentyPctButton:
            tip = 0.2
        default:
            break
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = sender.value
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let total = Double(billTextField.text!) {
            let bill = total * (1 + tip) / numberOfPeople
            eachPerson = round(bill * 100) / 100
            performSegue(withIdentifier: "goToResultsSegue", sender: self)
        } else {
            invalidBillAlert()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultsSegue" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.eachPerson = eachPerson
            resultsVC.tip = Int(tip * 100)
            resultsVC.numberOfPeople = Int(numberOfPeople)
        }
    }
    
    func invalidBillAlert() {
        let alert = UIAlertController(title: "Alert",
                                      message: "Invalid bill total",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
