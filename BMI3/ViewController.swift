//
//  ViewController.swift
//  BMI3
//
//  Created by Myoung-Wan Koo on 2016. 3. 30..
//  Copyright © 2016년 Myoung-Wan Koo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var weight : Double? = 0.0
    var height : Double? = 0.0
    
    var bmi: Double? {
        get {
            if (weight != nil) && (height != nil) {
                return weight! / (height! * height!)
            } else {
                return nil
            }
        }
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    
    @IBOutlet weak var heightPickerView: UIPickerView!
    
    
    @IBOutlet weak var weightPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

     // Update UI
    func updateUI() {
        if let b = self.bmi {
            self.bmiLabel.text = String(format: "%4.1f",b)
            print ( b, self.bmi )
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        guard let txt: String = textField.text else {
          return
        }
        print(" 1: ")
        func conv(numSring: String) -> Double? {
            let result : Double? = NSNumberFormatter().numberFromString(numSring)?.doubleValue
            return result
        }
        
            switch( textField) {
            case heightTextField:
                self.height = conv(txt)
                print("2")
            case weightTextField:
                self.weight = conv(txt)
                print("3")
            default:
                print(" Something Wrong")
            }
           print("4")
          updateUI()
    }
}

