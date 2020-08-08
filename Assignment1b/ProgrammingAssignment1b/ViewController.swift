//
//  ViewController.swift
//  ProgrammingAssignment1b
//
//  Created by Patrick Spafford on 6/7/20.
//  Copyright © 2020 Patrick Spafford. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController {
    
    @IBOutlet weak var displayedImage: UIImageView!
    
    let sec = UIImage(named: "sec")
    let auburn = UIImage(named: "auburn")
    let bama = UIImage(named: "bama")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayedImage.image = UIImage(named: "sec")
    }
    
    @IBOutlet weak var secButton: UIButton!
    @IBOutlet weak var auburnButton: UIButton!
    @IBOutlet weak var bamaButton: UIButton!
    
    
    @IBAction func secButtonHandler(_ sender: UIButton) {
        displayedImage.image = sec
    }
    
    @IBAction func auburnButtonHandler(_ sender: UIButton) {
        displayedImage.image = auburn
    }

    @IBAction func bamaButtonHandler(_ sender: UIButton) {
        displayedImage.image = bama
    }
    
   

}

