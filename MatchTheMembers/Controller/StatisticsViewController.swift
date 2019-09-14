//
//  StatisticsViewController.swift
//  MatchTheMembers
//
//  Created by shaina on 9/13/19.
//  Copyright © 2019 shaina. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var streak: UILabel!
    
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    
    var longestStreak = 0
    var lastThreeResponses: [String?] = []
    var lastThreeResults: [Bool?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        streak.text = "Longest Streak: " + String(longestStreak)
        
        if (lastThreeResponses[0] != nil) {
            first.text = lastThreeResponses[0]
            if (lastThreeResults[0] != nil) {
                if (lastThreeResults[0]!) {
                    first.backgroundColor = UIColor.green
                } else {
                    first.backgroundColor = UIColor.red
                }
            }
        }
        
        if (lastThreeResponses[1] != nil) {
            second.text = lastThreeResponses[1]
            if (lastThreeResults[1] != nil) {
                if (lastThreeResults[1]!) {
                    second.backgroundColor = UIColor.green
                } else {
                    second.backgroundColor = UIColor.red
                }
            }
        }
        
        if (lastThreeResponses[2] != nil) {
            third.text = lastThreeResponses[2]
            if (lastThreeResults[2] != nil) {
                if (lastThreeResults[2]!) {
                    third.backgroundColor = UIColor.green
                } else {
                    third.backgroundColor = UIColor.red
                }
            }
        }
 }
}
