//
//  ViewController.swift
//  Tipsy
//
//  Created by Nikita on 28.09.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tipSegmented: UISegmentedControl!
    @IBOutlet var splitLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let tipsyBrain = TipsyBrain()
    
    var tts: TTS?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont.systemFont(ofSize: 25)
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        tipSegmented.setTitleTextAttributes(attributes, for: .normal)
        
    }
    
    @IBAction func splitChanger(_ sender: UIStepper) {
        splitLabel.text = String(format: "%1.f", sender.value)
    }
    
    
    @IBAction func calculateAction(_ sender: UIButton) {
        
        guard let billTotal = Double(textField.text ?? "0.0") else {
            print("bill is not value")
            return
            }
        
        let tip: Double = Double(tipSegmented.selectedSegmentIndex) / 10
        let countOfSplitPeople = Double(splitLabel.text!)!
        
        tts = TTS(billTotal: billTotal, tip: tip, peopleSplit: countOfSplitPeople)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToTotal" {
            let destinationVC = segue.destination as! ResultViewController
            
            guard let tts = self.tts else {
                print("tts is nil")
                return
            }
            
            destinationVC.total = tipsyBrain.calculateForPerson(tts: tts)
            destinationVC.tip = tts.tip
            destinationVC.peopleSplit = tts.peopleSplit
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
