//
//  ViewController.swift
//  Assignment2a
//
//  Created by Patrick Spafford on 6/17/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loanAmount: UITextField!
    
    @IBOutlet weak var numberOfPayments: UITextField!
    
    @IBOutlet weak var interestRate: UITextField!
    
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loanAmount.text = "0"
        numberOfPayments.text = "0"
        interestRate.text = "0"
        
    }
    
    @IBAction func textFieldDoneEditing(_ sender: Any) {
        loanAmount.resignFirstResponder()
        numberOfPayments.resignFirstResponder()
        interestRate.resignFirstResponder()
    }
    
    @IBAction func calculateMortage(_ sender: UIButton) {
        let L: Double! = Double(loanAmount.text!)
        var r: Double! = Double(interestRate.text!)
        r = Double(r / 100)
        let n: Double! = Double(numberOfPayments.text!)
        let r12 = Double(r)
        let numerator = Double(L * ( r12 * pow((1 + r12), n )))
        let denominator = Double(pow((1 + r12), n) - 1)
        let output = Double(numerator / denominator)
        let formattedOutput = String(format: "%.2f", output)
        total.text = "$\(formattedOutput)"
        
        
    }
    
}
