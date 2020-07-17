//
//  ViewController.swift
//  Swift Project
//
//  Created by gunhyeong on 2020/07/18.
//  Copyright © 2020 geonhyeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLabel(_ sender: Any) {
        lblWelcome.text = "You can do it!"
    }
}

