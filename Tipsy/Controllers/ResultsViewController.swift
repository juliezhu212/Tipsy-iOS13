//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Xinyi Zhu on 5/27/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var eachPerson: Double?
    var tipPercentage: Int?
    var numberOfPeople: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", eachPerson ?? 0)
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people, with \(tipPercentage ?? 0)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */
}
