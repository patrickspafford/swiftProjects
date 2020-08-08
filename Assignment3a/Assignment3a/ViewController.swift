//
//  ViewController.swift
//  Assignment3a
//
//  Created by Patrick Spafford on 7/12/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
     @IBOutlet weak var picker: UIPickerView!
    
    private var pickerItems = ["Thing One", "Thing Two", "Thing Three"]
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func onSelectPressed(_ sender: UIButton) {
        let row = picker.selectedRow(inComponent: 0)
        let selected = pickerItems[row]
        let message = "You selected \(selected)"
        let alert = UIAlertController(
            title: "Selection",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func onReplacePressed(_ sender: UIButton) {
        let row = picker.selectedRow(inComponent: 0)
        pickerItems[row] = textField.text!
        picker.reloadAllComponents()
    }
    
    @IBAction func onInsertPressed(_ sender: UIButton) {
         let row = picker.selectedRow(inComponent: 0)
        pickerItems.insert(textField.text!, at: row + 1)
        picker.reloadAllComponents()
        picker.selectRow(row + 1, inComponent: 0, animated: true)
        picker.reloadAllComponents()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerItems.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerItems[row]
    }
    
    
}

