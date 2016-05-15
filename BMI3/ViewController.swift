//
//  ViewController.swift
//  BMI3
//
//  Created by Myoung-Wan Koo on 2016. 3. 30..
//  Copyright © 2016년 Myoung-Wan Koo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
    class func doDiv100(u: Int) -> Double {
        return Double(u) * 0.01
    }
    class func doDiv2(u: Int) -> Double {
        return Double(u) * 0.5
    }
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
    
    let listOfHeightsInM  = Array(140...220).map(ViewController.doDiv100)
    let listOfWeightsInKg = Array(80...240).map(ViewController.doDiv2)
    
    
    
    
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
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        guard let txt: String = textField.text else {
          return
        }
        func conv(numSring: String) -> Double? {
            let result : Double? = NSNumberFormatter().numberFromString(numSring)?.doubleValue
            return result
        }
        
            switch( textField) {
            case heightTextField:
                self.height = conv(txt)
            case weightTextField:
                self.weight = conv(txt)
            default:
                print(" Something Wrong")
            }
          updateUI()
    }
    
    // PickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch (pickerView) {
        case heightPickerView:
            return self.listOfHeightsInM.count
        case weightPickerView:
            return self.listOfWeightsInKg.count
        default:
            return 1
        
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (pickerView) {
        case heightPickerView:
            return String(format: "%4.2f",self.listOfHeightsInM[row])
        case weightPickerView:
            return String(format: "%4.1f", self.listOfWeightsInKg[row])
        default:
            return ""
            
        }

    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (pickerView) {
        case heightPickerView:
            self.height = self.listOfHeightsInM[row]
        case weightPickerView:
            self.weight = self.listOfWeightsInKg[row]
        default:
            break
            
        }

        updateUI()
    }
}

