//
//  StartVC.swift
//  MertKoroglu_HW1
//
//  Created by CTIS Student on 7.03.2024.
//  Copyright © 2024 CTIS. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet weak var mLabel: UILabel!
    
    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var mImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mLabel.text = "Calculation Controller"
        mImageView.image = UIImage(named: "calculation")
        mImageView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        
        switch mSegmentedControl.selectedSegmentIndex {  // switch sender.selectedSegmentIndex
        case 0:
            mLabel.text = "Calculation Controller"
            mImageView.image = UIImage(named: "calculation")
        case 1:
            mLabel.text = "WTHR Controller"
            mImageView.image = UIImage(named: "whtr")
        case 2:
            mLabel.text = "Player Controller"
            mImageView.image = UIImage(named: "player")
        case 3:
            mLabel.text = "About Controller"
            mImageView.image = UIImage(named: "about")
        default:
            break
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
      
        switch mSegmentedControl.selectedSegmentIndex {  // switch sender.selectedSegmentIndex
        case 0:
            mSegmentedControl.selectedSegmentIndex = 1
            mLabel.text = "WTHR Controller"
            mImageView.image = UIImage(named: "whtr")
        case 1:
            mSegmentedControl.selectedSegmentIndex = 2
            mLabel.text = "Player Controller"
            mImageView.image = UIImage(named: "player")
        case 2:
            mSegmentedControl.selectedSegmentIndex = 3
            mLabel.text = "About Controller"
            mImageView.image = UIImage(named: "about")
        case 3:
            mSegmentedControl.selectedSegmentIndex = 0
            mLabel.text = "Calculation Controller"
            mImageView.image = UIImage(named: "calculation")
        default:
            break
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("works3")
        if segue.identifier == "AboutVC" {
            print("works2")
            if let mController = segue.destination as? AboutVC {
                print("works")
                mController.mColor = UIColor(red: 0.7, green: 0.0, blue: 0.3, alpha: 1.0)
                mController.mText = "CTIS480: Homework 1"
                mController.mFont = UIFont.boldSystemFont(ofSize: 24)
                mController.mTopText = "About Controller"
            }
        }
        
    }
    
    
    @IBAction func onLongPress(_ sender: UILongPressGestureRecognizer) {
        switch mSegmentedControl.selectedSegmentIndex {  // switch sender.selectedSegmentIndex
        case 0:
            performSegue(withIdentifier: "CalculationVC", sender: self)
        case 1:
            performSegue(withIdentifier: "WhtrVC", sender: self)
        case 2:
            performSegue(withIdentifier: "PlayerVC", sender: self)
        case 3:
            performSegue(withIdentifier: "AboutVC", sender: self)
        default:
            break
        }
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
        print("unwind")
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
