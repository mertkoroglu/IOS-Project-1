//
//  AboutVC.swift
//  MertKoroglu_HW1
//
//  Created by CTIS Student on 7.03.2024.
//  Copyright © 2024 CTIS. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    var mColor: UIColor? = nil
    var mText: String? = nil
    var mFont: UIFont? = nil
    var mTopText: String? = nil
    
    @IBOutlet weak var mTopLabel: UILabel!
    @IBOutlet weak var mLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let temp = mColor {
            mLabel.textColor = temp
        }
        if let temp2 = mText {
            mLabel.text = temp2
        }
        if let temp3 = mFont {
            mLabel.font = temp3
        }
        if let temp4 = mTopText {
            mTopLabel.text = temp4
        }
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
