//
//  ViewController.swift
//  TrustOr
//
//  Created by Dmitry Dementyev on 13.08.2018.
//  Copyright © 2018 Dmitry Dementyev. All rights reserved.
//

import UIKit

enum Mode {
    case offline
    case onlineNew
    case onlineJoin
}

class NewGameVC: UIViewController {

    var playersTVC: PlayersTVC!
    var game: GameData!
    var playersData = PlayersData()
    var wordsQtyData = [20,30,40,50,60,70,80,90,100,120,140,160,250,400,600]
    var hardnessData : [Difficulty] = [.easy, .normal, .hard]
    var secQtyData = [10,20,30,40,50,60]
    var mode : Mode!
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var play: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Colors.background
        play.turnClickSoundOn(sound: K.Sounds.click)
        title = "Кто играет?"
        
        picker.delegate = self
        picker.dataSource = self
        
        picker.selectRow(4, inComponent: 0, animated: true)
        picker.selectRow(1, inComponent: 1, animated: true)
        picker.selectRow(2, inComponent: 2, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: K.Colors.foreground]
        if mode != .offline {
            play.isEnabled = false
            play.backgroundColor = K.Colors.lightGray
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlayersList" {
            playersData.load()
            playersTVC = segue.destination as? PlayersTVC
            playersTVC?.playersData = playersData
            playersTVC.mode = mode
            
        }
        if segue.identifier == "toStartPair" {
            let wordsQty = wordsQtyData[picker.selectedRow(inComponent: 0)]
            let difficulty = hardnessData[picker.selectedRow(inComponent: 1)]
            let time = secQtyData[picker.selectedRow(inComponent: 2)]
            game = GameData(wordsQty: wordsQty, difficulty: difficulty, time: time, players: playersData.players)
            let startPairVC = segue.destination as? StartPairVC
            startPairVC?.game = self.game
            playersData.save()
        }
    }
}

extension NewGameVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return wordsQtyData.count
        case 1: return hardnessData.count
        default: return secQtyData.count
        }
    }
}
extension NewGameVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        switch component {
        case 0: return NSAttributedString(string: String(wordsQtyData[row])+" слов", attributes: [NSAttributedString.Key.foregroundColor : K.Colors.foreground])
        case 1: return NSAttributedString(string: K.diffNames[hardnessData[row]]!, attributes: [NSAttributedString.Key.foregroundColor : K.Colors.foreground])
        default: return NSAttributedString(string: String(secQtyData[row])+" сек", attributes: [NSAttributedString.Key.foregroundColor : K.Colors.foreground])
        }
    }
}


