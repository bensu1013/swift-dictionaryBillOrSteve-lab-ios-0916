//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreCounter: UILabel!
    
    @IBOutlet weak var textBox: UILabel!
    
    @IBAction func teamSteve(sender: AnyObject) {
        print("ClickSteve")
        switch currentFact.0 {
        case "":
            showFact(getRandomFact())
        case "Steve Jobs":
            currentScore += 1
            scoreCounter.text = String("\(currentScore)")
            removeFunFact()
            showFact(getRandomFact())
        case "Complete":
            showFact(currentFact)
        default:
            showFact(getRandomFact())
        }
        
    }
    @IBAction func teamPCMasterRace(sender: AnyObject) {
        print("ClickBill")
        switch currentFact.0 {
        case "":
            showFact(getRandomFact())
        case "Bill Gates":
            currentScore += 1
            scoreCounter.text = String("\(currentScore)")
            removeFunFact()
            showFact(getRandomFact())
        case "Complete":
            showFact(currentFact)
        default:
            showFact(getRandomFact())
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
    }
    var currentFact: (String, Int) = ("",0)
    var funFacts: [String :[String]] = [:]
    var currentScore: Int = 0
    func createFacts() {
        funFacts["Steve Jobs"] = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."]
        funFacts["Bill Gates"] = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
            "He scored 1590 (out of 1600) on his SATs.",
            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        funFacts["Complete"] = ["That's all folks! Hope this worked out well enough to impress myself."]
    }
    
    func removeFunFact() {
        funFacts[currentFact.0]!.removeAtIndex(currentFact.1)
    }
    
    func stillHaveFacts(name: String) -> Bool {
        if funFacts[name]!.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    func switchName(name: String) -> String {
        switch name {
        case "Steve Jobs":
            return "Bill Gates"
        case "Bill Gates":
            return "Steve Jobs"
        default:
            return ""
        }
    }
    
    func getRandomFact() -> (String, Int) {
        var factCount: Int = 0
        let tempname: String = randomPerson()
        let othername: String = switchName(tempname)
        
        if stillHaveFacts(tempname) {
            factCount = randomNumberFromZeroTo((funFacts[tempname]!.count) - 1)
            return (tempname, factCount)
            print("RandomSteve")
        } else if stillHaveFacts(othername) {
            factCount = randomNumberFromZeroTo((funFacts[othername]!.count) - 1)
            print("RandomBill")
            return (othername, factCount)
        } else {
            return ("Complete", 0)
        }
    }
    
    func showFact(item: (String, Int)) {
        var tempText: String = ""
        tempText = funFacts[item.0]![item.1]
        currentFact = item
        textBox.text = tempText
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
}




