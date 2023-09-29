//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Nikita on 29.09.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    var total: Double = 0
    var tip: Double = 0
    var peopleSplit: Double = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(format: "%.2f", total)
        textLabel.text = "Split between \(String(format: "%.0f", peopleSplit)) people, with \(tip * 100)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateAction(_ sender: UIButton) {
        self.dismiss(animated: true)
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
