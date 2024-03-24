//
//  CalculationVC.swift
//  MertKoroglu_HW1
//
//  Created by CTIS Student on 7.03.2024.
//  Copyright © 2024 CTIS. All rights reserved.
//

import UIKit

class CalculationVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let shapes = ["Sphere", "Cone", "Cylinder"]
    let mTitle = "Result"
    var selectedShape: String = "Sphere"
    
    @IBOutlet weak var mRadiusTextField: UITextField!
    
    @IBOutlet weak var mHeightLabel: UILabel!
    
    @IBOutlet weak var mUIView: UIView!
    
    @IBOutlet weak var mImageView: UIImageView!
    

    @IBAction func mCalculateBtn(_ sender: Any) {
    }
    
    @IBOutlet weak var mHeightTextField: UITextField!
    
    @IBOutlet weak var mPickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shapes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shapes[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      switch row {
             case 0:
                 mImageView.image = UIImage(named: "sphere")
                 mHeightLabel.isHidden = true
                 mHeightTextField.isHidden = true
                 selectedShape = "Sphere"
             case 1:
                 mImageView.image = UIImage(named: "cone")
                 mHeightLabel.isHidden = false
                 mHeightTextField.isHidden = false
                 selectedShape = "Cone"
             case 2:
                 mImageView.image = UIImage(named: "cylinder")
                 mHeightLabel.isHidden = false
                 mHeightTextField.isHidden = false
                 selectedShape = "Cylinder"
             default:
                 break
             }
             
    }
    
    
    @IBAction func onCalculateClick(_ sender: UIButton) {
        
        var height, radius: Double
        var area, volume: Double
        var output: String = ""
        
        height = Double(mHeightTextField.text!) ?? 0.0
        radius = Double(mRadiusTextField.text!) ?? 0.0
     
        
        if((height != 0.0 && radius != 0.0 && selectedShape != "Sphere") || (radius != 0.0 && selectedShape == "Sphere")){
            switch selectedShape {
                case "Sphere":
                    area = 4 * Double.pi * (radius * radius)
                    volume = 4 / 3 * Double.pi * (radius * radius * radius)
                    area = round(area * 100) / 100.0
                    volume = round(volume * 100) / 100.0
                    output = "\(selectedShape) Surface Area = \(area) and Volume = \(volume) "
                case "Cone":
                    area = Double.pi * radius * (radius + sqrt(radius * radius + height * height))
                    volume = 1 / 3 * Double.pi * (radius * radius) * height
                    area = round(area * 100) / 100.0
                    volume = round(volume * 100) / 100.0
                    output = "\(selectedShape) Surface Area = \(area) and Volume = \(volume) "
                case "Cylinder":
                    area = 2 * Double.pi * radius * (radius + height)
                    volume = Double.pi * (radius * radius) * height
                    area = round(area * 100) / 100.0
                    volume = round(volume * 100) / 100.0
                    output = "\(selectedShape) Surface Area = \(area) and Volume = \(volume) "
                default:
                    break
            }
            
            let mAlert = UIAlertController(title: mTitle, message: output, preferredStyle: .alert)
            // Event Handler for the button
            mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            // Displaying the Alert
            self.present(mAlert, animated: true, completion: nil)
        }else if(radius == 0.0 && selectedShape == "Sphere"){
            let mAlert = UIAlertController(title: "Error", message: "Radius Field Cannot be Empty", preferredStyle: .alert)
            // Event Handler for the button
            mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            // Displaying the Alert
            self.present(mAlert, animated: true, completion: nil)
        }else if((height == 0.0 || radius == 0.0) && selectedShape != "Sphere"){
            let mAlert = UIAlertController(title: "Error", message: "Radius or Height Field Cannot be Empty", preferredStyle: .alert)
            // Event Handler for the button
            mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            // Displaying the Alert
            self.present(mAlert, animated: true, completion: nil)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("test")
        textField.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mPickerView.selectRow(0, inComponent: 0, animated: true)
        mImageView.image = UIImage(named: "sphere")
        mHeightLabel.isHidden = true
        mHeightTextField.isHidden = true
        mUIView.layer.cornerRadius = 5
        mUIView.layer.borderWidth = 1
        mUIView.layer.shadowOpacity = 125
        mUIView.layer.shadowOffset = CGSize(width: 5, height: 5)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
