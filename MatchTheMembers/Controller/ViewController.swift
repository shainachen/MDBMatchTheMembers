//
//  ViewController.swift
//  MatchTheMembers
//
//  Created by shaina on 9/12/19.
//  Copyright © 2019 shaina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startStopButton: UIButton!
    var isStart = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startStopPressed(_ sender: UIButton) {
        if (isStart) {
            startStopButton.setTitle("Stop", for: .normal)
        } else {
            startStopButton.setTitle("Start", for: .normal)
        }
        isStart.toggle()
    }
    
}

