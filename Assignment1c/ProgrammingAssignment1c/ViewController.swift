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
    @IBOutlet weak var displayedImage2: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    var auburn = UIImage(named: "auburn")
    var bama = UIImage(named: "bama")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayedImage.image = auburn
        displayedImage2.image = bama
        displayedImage.alpha = 0.5
        displayedImage2.alpha = 0.5
        slider.value = 0.5
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        
    }
    
   
    
    
    @IBAction func sliderHandler(_ sender: UISlider) {
        let sliderValue = sender.value
        let auburnValue = CGFloat(1.0 - sliderValue)
        let bamaValue = CGFloat(sliderValue)
        displayedImage.alpha = auburnValue
        displayedImage2.alpha = bamaValue
    }

    
   

}

