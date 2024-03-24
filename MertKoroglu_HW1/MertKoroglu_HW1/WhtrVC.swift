//
//  WhtrVC.swift
//  MertKoroglu_HW1
//
//  Created by CTIS Student on 7.03.2024.
//  Copyright © 2024 CTIS. All rights reserved.
//

import UIKit

class WhtrVC: UIViewController {

    @IBOutlet weak var mCalculateBtn: UIButton!
    @IBOutlet weak var mWeight: UITextField!
    @IBOutlet weak var mHeight: UITextField!
    @IBOutlet weak var mGenderBtn: UISwitch!
    @IBOutlet weak var mWhtr: UILabel!
    @IBOutlet weak var mWhtrEval: UILabel!
    @IBOutlet weak var mWhtrLabel: UILabel!
    @IBOutlet weak var mGenderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mWhtr.isHidden = true
        mWhtrEval.isHidden = true
        mWhtrLabel.isHidden = true
        
        mGenderLabel.text = "Gender (female)"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClick(_ sender: UIButton) {
        var waist, height: Double
        
        waist = Double(mWeight.text!) ?? 0.0
        height = Double(mHeight.text!) ?? 0.0
        
        var result: Double
        
        result = 0.0
        
        if(waist != 0.0 && height != 0.0){
            result = waist / height * 100
            result = round(result * 100) / 100.0
                   
            mWhtr.text = String(result)
            
            mWhtr.isHidden = false
            mWhtrEval.isHidden = false
            mWhtrLabel.isHidden = false
        }else{
            let mAlert = UIAlertController(title: "Error", message: "Waist or Height is Empty", preferredStyle: .alert)
            // Event Handler for the button
            mAlert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            // Displaying the Alert
            self.present(mAlert, animated: true, completion: nil)
        }
        
        if(mGenderBtn.isOn == true){
            if(result < 35){
                mWhtrEval.text = "Abnormally Slim to Underweight"
            }
            else if(result >= 35 && result < 43){
                mWhtrEval.text = "Extermely Slim"
            }
            else if(result >= 43 && result < 46){
                mWhtrEval.text = "Slender and Healthy"
            }else if(result >= 46 && result < 53){
                mWhtrEval.text = "Healthy, Normal Weight"
            }else if(result >= 53 && result < 58){
                mWhtrEval.text = "Overweight"
            }else if(result >= 58 && result < 63){
                mWhtrEval.text = "Extremely Overweight/Obese"
            }else{
                mWhtrEval.text = "Highly Obese"
            }
        }else{
            if(result < 35){
                mWhtrEval.text = "Abnormally Slim to Underweight"
            }
            else if(result >= 35 && result < 42){
                mWhtrEval.text = "Extermely Slim"
            }
            else if(result >= 42 && result < 46){
                mWhtrEval.text = "Slender and Healthy"
            }else if(result >= 46 && result < 49){
                mWhtrEval.text = "Healthy, Normal Weight"
            }else if(result >= 49 && result < 54){
                mWhtrEval.text = "Overweight"
            }else if(result >= 54 && result < 58){
                mWhtrEval.text = "Seriously Overweight"
            }else{
                mWhtrEval.text = "Highly Obese"
            }
        }
        
        
        // Unwrapping an optional and type cassting it makes it an optional
        //number1 = Double(num1.text!)!
        //number2 = Double(num2.text!)!
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func onChange(_ sender: UISwitch) {
        if(mGenderBtn.isOn == true){
            mWhtrLabel.text = "Whtr (male)"
            mGenderLabel.text = "Gender (male)"
        }else if(mGenderBtn.isOn == false){
            mWhtrLabel.text = "Whtr (female)"
            mGenderLabel.text = "Gender (female)"
        }
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
