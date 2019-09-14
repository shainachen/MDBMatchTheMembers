//
//  GameViewController.swift
//  MatchTheMembers
//
//  Created by shaina on 9/12/19.
//  Copyright © 2019 shaina. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var member_image: UIImageView!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var nameOne: UIButton!
    @IBOutlet weak var nameTwo: UIButton!
    @IBOutlet weak var nameThree: UIButton!
    @IBOutlet weak var nameFour: UIButton!
    
    //scores
    var gameScore = 0
    var streak = 0
    var longestStreak = 0

    //member selection
    var member: String!
    var selectedMembers: [String]!
    var lastThreeResponses = ["","",""]
    var lastThreeResults = [false, false, false]
    
    //navigation
    var fromStats = false
    
    //timers
    var myTimer:Timer?
    var buttonTimer:Timer?
    var timeLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if fromStats {
            resumeGame()
        } else {
            setGame()
        }
    }
    
    func resumeGame() {
        fromStats = false
        
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    func setGame() {
        //display score
        score.text = "Score: " + String(gameScore)
        
        //choosing member to display
        member = Constants.names.randomElement()!
        member_image.image = Constants.getImageFor(name: member)
        selectedMembers = [member]
        
        //add other three member names
        for _ in 1...3 {
            let name = getRandomName(members: selectedMembers)
            selectedMembers.append(name)
        }
        
        selectedMembers.shuffle()
        
        //set button titles to names
        nameOne.setTitle(selectedMembers[0], for: .normal)
        nameTwo.setTitle(selectedMembers[1], for: .normal)
        nameThree.setTitle(selectedMembers[2], for: .normal)
        nameFour.setTitle(selectedMembers[3], for: .normal)

        //initialize and begin timer
        timeLeft = 5
        timer.text = String(timeLeft) + " Seconds Left"
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires(){
        timeLeft -= 1
        print(timeLeft)
        timer.text =  String(timeLeft) + " Seconds Left"
        
        if timeLeft <= 0 && myTimer != nil{
            myTimer!.invalidate()
            myTimer = nil
            outOfTime()
        }
    }
    
    //find random name to add to list of members to display
    func getRandomName(members: [String]) -> String {
        var member = Constants.names.randomElement()!
        while members.contains(member) {
            member = Constants.names.randomElement()!
        }
        return member
    }
    
    //update scoring and responses list given correct answer
    func correctAnswer(index: Int) {
        gameScore+=1
        streak+=1
        if (streak > longestStreak) {
            longestStreak = streak
        }
        lastThreeResponses.append(selectedMembers[index])
        lastThreeResults.append(true)
        
        if lastThreeResponses.count > 3 {
            lastThreeResults.removeFirst()
            lastThreeResponses.removeFirst()
        }
    }
    
    func outOfTime() {
        if (streak > longestStreak) {
            longestStreak = streak
        }
        streak = 0
        setGame()
    }
    
    //update scoring and responses list given incorrect answer
    func incorrectAnswer(index: Int) {
        if (streak > longestStreak) {
            longestStreak = streak
        }
        streak = 0
       lastThreeResponses.append(selectedMembers[index])
        lastThreeResults.append(false)
        
        if lastThreeResponses.count > 3 {
            lastThreeResults.removeFirst()
            lastThreeResponses.removeFirst()
        }
    }
    
    //when first name button is selected
    @IBAction func nameOneAction(_ sender: UIButton) {
        if selectedMembers[0] == member {
            nameOne.backgroundColor = UIColor.green
            correctAnswer(index: 0)
        } else {
            nameOne.backgroundColor = UIColor.red
            incorrectAnswer(index: 0)
        }
        myTimer!.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            self.nameOne.backgroundColor = UIColor.white
            self.setGame()
        }
    }
    
    //when second name button is selected
    @IBAction func nameTwoAction(_ sender: UIButton) {
        if selectedMembers[1] == member {
            nameTwo.backgroundColor = UIColor.green
            correctAnswer(index: 1)
        } else {
            nameTwo.backgroundColor = UIColor.red
            incorrectAnswer(index: 1)
        }
        myTimer!.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            self.nameTwo.backgroundColor = UIColor.white
            self.setGame()
        }
    }
    
    //when third name button is selected
    @IBAction func nameThreeAction(_ sender: UIButton) {
        if selectedMembers[2] == member {
            nameThree.backgroundColor = UIColor.green
            correctAnswer(index: 2)
        } else {
            nameThree.backgroundColor = UIColor.red
            incorrectAnswer(index: 2)
        }
        myTimer!.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            self.nameThree.backgroundColor = UIColor.white
            self.setGame()
        }
    }
    
    //when fourth name button is selected
    @IBAction func nameFourAction(_ sender: UIButton) {
        if selectedMembers[3] == member {
            nameFour.backgroundColor = UIColor.green
            correctAnswer(index: 3)
        } else {
            nameFour.backgroundColor = UIColor.red
            incorrectAnswer(index: 3)
        }
        myTimer!.invalidate()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1000)) {
            self.nameFour.backgroundColor = UIColor.white
            self.setGame()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatisticsScreen" {
            if let dest = segue.destination as? StatisticsViewController {
                myTimer!.invalidate()
                fromStats = true
                dest.longestStreak = longestStreak
                dest.lastThreeResults = lastThreeResults
                dest.lastThreeResponses = lastThreeResponses
        }
    }
    }
    
}
