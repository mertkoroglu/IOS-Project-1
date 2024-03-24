//
//  PlayerVC.swift
//  MertKoroglu_HW1
//
//  Created by CTIS Student on 7.03.2024.
//  Copyright © 2024 CTIS. All rights reserved.
//

import UIKit

class PlayerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate  {
    
    
    var mPlayersArray: NSMutableArray = []
    var mFenerbahcePlayers: [String] = []
    var mBesiktasPlayers: [String] = []
    var mGalatasarayPlayers: [String] = []
    var mCurrentPlayers: [String] = []
    
    var TableArray: [String] = []
    var TableArrayTeams: [String] = []
    
    var FenerbahceBool: Bool = true
    var BesiktasBool: Bool = true
    var GalatasarayBool: Bool = true
    
    
    @IBOutlet weak var mImageBesiktas: UIImageView!
    @IBOutlet weak var mImageFenerbahce: UIImageView!
    @IBOutlet weak var mImageGalatasaray: UIImageView!
    @IBOutlet weak var mPickerView: UIPickerView!
    @IBOutlet weak var mTableView: UITableView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mCurrentPlayers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mCurrentPlayers[row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    // Filling the rows with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        // Recommended way
        let cell = mTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        
        let mImage = UIImage(named: TableArrayTeams[indexPath.row])
        cell.imageView?.image = mImage
        
        return cell
        
    }
    @IBAction func onBesiktasTap(_ sender: UITapGestureRecognizer) {
        print("Besiktas")
        mCurrentPlayers = mBesiktasPlayers
        mPickerView.reloadAllComponents()
        if BesiktasBool{
            setTeamTable(players: mBesiktasPlayers, team: "besiktas")
            mTableView.reloadData()
            BesiktasBool = false
        }
    }
    
    func setTeamTable(players: [String], team: String){
        TableArray += players
        var i = 0
        while(i < players.count){
            TableArrayTeams.append(team)
            i += 1
        }
    }
    
    @IBAction func onGalatasarayTap(_ sender: UITapGestureRecognizer) {
        print("Galatasaray")
        mCurrentPlayers = mGalatasarayPlayers
        mPickerView.reloadAllComponents()
        if GalatasarayBool{
            setTeamTable(players: mGalatasarayPlayers, team: "galatasaray")
            mTableView.reloadData()
            GalatasarayBool = false
            
        }
    }
    
    @IBAction func onFenerbahceTap(_ sender: UITapGestureRecognizer) {
        print("Fenerbahce")
        mCurrentPlayers = mFenerbahcePlayers
        mPickerView.reloadAllComponents()
        if FenerbahceBool{
            setTeamTable(players: mFenerbahcePlayers, team: "fenerbahce")
            mTableView.reloadData()
            FenerbahceBool = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mImageBesiktas.image = UIImage(named: "besiktas")
        mImageFenerbahce.image = UIImage(named: "fenerbahce")
        mImageGalatasaray.image = UIImage(named: "galatasaray")
        
        mImageBesiktas.isUserInteractionEnabled = true
        mImageFenerbahce.isUserInteractionEnabled = true
        mImageGalatasaray.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
        let bundle = Bundle.main
        if let url = bundle.url(forResource: "players", withExtension: "plist") {
            mPlayersArray = NSMutableArray(contentsOf: url)!
        }
        
        for case let playerDict as [String:String] in mPlayersArray{
            if let playerName1 = playerDict["fenerbahce"]{
                mFenerbahcePlayers.append(playerName1)
            }
            if let playerName2 = playerDict["galatasaray"]{
                mGalatasarayPlayers.append(playerName2)
            }
            if let playerName3 = playerDict["besiktas"]{
                mBesiktasPlayers.append(playerName3)
            }
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
