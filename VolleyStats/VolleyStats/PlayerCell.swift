//
//  PlayerCell.swift
//  VolleyStats
//
//  Created by Logan Allen on 12/18/15.
//  Copyright © 2015 loganallen. All rights reserved.
//

import UIKit

class PlayerCell: UICollectionViewCell {
    
    var player: Player!
    var playerPic: UIImageView!
    
    var areaStart: Int!
    var areaHeight: Int!
    
    var attackLabel: UILabel!
    var defenseLabel: UILabel!
    var passingLabel: UILabel!
    var serve_receiveLabel: UILabel!
    
    var hitKill: UIButton!
    var hitAttempt: UIButton!
    var hitError: UIButton!
    
    var blockKill: UIButton!
    var blockAssist: UIButton!
    var blockError: UIButton!
    
    var assist: UIButton!
    var pass: UIButton!
    var passError: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print(self.bounds.height)
        
        let picSize = Int(floor(self.bounds.height/4))
        playerPic = UIImageView(frame: CGRect(x: 5, y: 5, width: picSize, height: picSize))
        
        self.areaStart = Int(floor(self.bounds.height/3))
        self.areaHeight = 2*areaStart
        
        createLabels()
        createAttackButtons()
        createDefenseButtons()
        createPassingButtons()
        createServeButtons()
        
        self.layer.borderColor = UIColor.blueColor().CGColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLabels(){
        attackLabel = UILabel(frame: CGRect(x: 5, y: areaStart, width: Int(self.bounds.width/2), height: areaHeight/12))
        defenseLabel = UILabel(frame: CGRect(x: 5, y: areaStart + areaHeight/4, width: Int(self.bounds.width/2), height: areaHeight/12))
        passingLabel = UILabel(frame: CGRect(x: 5, y: areaStart + areaHeight/2, width: Int(self.bounds.width/2), height: areaHeight/12))
        serve_receiveLabel = UILabel(frame: CGRect(x: 5, y: areaStart + areaHeight*3/4, width: Int(self.bounds.width/2), height: areaHeight/12))
        
        attackLabel.text = "Offense"
        attackLabel.font = UIFont(name: "Gill Sans", size: 7)
        defenseLabel.text = "Defense"
        defenseLabel.font = UIFont(name: "Gill Sans", size: 7)
        passingLabel.text = "Passing"
        passingLabel.font = UIFont(name: "Gill Sans", size: 7)
        serve_receiveLabel.text = "Serve Receive"
        serve_receiveLabel.font = UIFont(name: "Gill Sans", size: 7)
        
        addSubview(self.attackLabel)
        addSubview(self.defenseLabel)
        addSubview(self.passingLabel)
        addSubview(self.serve_receiveLabel)
    }
    
    func createAttackButtons(){
        hitKill = UIButton(frame: CGRect(x: 0, y: areaStart + areaHeight/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        hitKill.addTarget(self, action: "hitKill:", forControlEvents: .TouchUpInside)
        hitKill.backgroundColor = UIColor(red: 0, green: 0, blue: 200/250, alpha: 1)
        hitKill.layer.borderColor = UIColor.whiteColor().CGColor
        hitKill.layer.borderWidth = 1
        hitKill.setTitle("Hit Kill", forState: .Normal)
        
        hitAttempt = UIButton(frame: CGRect(x: Int(self.bounds.width/3), y: areaStart + areaHeight/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        hitAttempt.addTarget(self, action: "hitAttempt:", forControlEvents: .TouchUpInside)
        hitAttempt.backgroundColor = UIColor(red: 0, green: 0, blue: 125/250, alpha: 1)
        hitAttempt.layer.borderColor = UIColor.whiteColor().CGColor
        hitAttempt.layer.borderWidth = 1
        hitAttempt.setTitle("Hit Attempt", forState: .Normal)
        
        hitError = UIButton(frame: CGRect(x: 2*Int(self.bounds.width/3), y: areaStart + areaHeight/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        hitError.addTarget(self, action: "hitError:", forControlEvents: .TouchUpInside)
        hitError.backgroundColor = UIColor(red: 0, green: 0, blue: 75/250, alpha: 1)
        hitError.layer.borderColor = UIColor.whiteColor().CGColor
        hitError.layer.borderWidth = 1
        hitError.setTitle("Hit Error", forState: .Normal)
        
        addSubview(hitKill)
        addSubview(hitAttempt)
        addSubview(hitError)
    }
    
    func createDefenseButtons(){
        blockKill = UIButton(frame: CGRect(x: 0, y: areaStart + areaHeight/3, width: Int(self.bounds.width/3), height: areaHeight/6))
        blockKill.addTarget(self, action: "blockKill:", forControlEvents: .TouchUpInside)
        blockKill.backgroundColor = UIColor(red: 0, green: 200/250, blue: 0, alpha: 1)
        blockKill.layer.borderColor = UIColor.whiteColor().CGColor
        blockKill.layer.borderWidth = 1
        blockKill.setTitle("Block Kill", forState: .Normal)
        
        blockAssist = UIButton(frame: CGRect(x: Int(self.bounds.width/3), y: areaStart + areaHeight/3, width: Int(self.bounds.width/3), height: areaHeight/6))
        blockAssist.addTarget(self, action: "blockAssist:", forControlEvents: .TouchUpInside)
        blockAssist.backgroundColor = UIColor(red: 0, green: 125/250, blue: 0, alpha: 1)
        blockAssist.layer.borderColor = UIColor.whiteColor().CGColor
        blockAssist.layer.borderWidth = 1
        blockAssist.setTitle("Block Attempt", forState: .Normal)
        
        blockError = UIButton(frame: CGRect(x: 2*Int(self.bounds.width/3), y: areaStart + areaHeight/3, width: Int(self.bounds.width/3), height: areaHeight/6))
        blockError.addTarget(self, action: "blockError:", forControlEvents: .TouchUpInside)
        blockError.backgroundColor = UIColor(red: 0, green: 75/250, blue: 0, alpha: 1)
        blockError.layer.borderColor = UIColor.whiteColor().CGColor
        blockError.layer.borderWidth = 1
        blockError.setTitle("Block Error", forState: .Normal)
        
        addSubview(blockKill)
        addSubview(blockAssist)
        addSubview(blockError)
    }
    
    func createPassingButtons(){
        assist = UIButton(frame: CGRect(x: 0, y: areaStart + areaHeight*7/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        assist.addTarget(self, action: "assist:", forControlEvents: .TouchUpInside)
        assist.backgroundColor = UIColor(red: 200/250, green: 0, blue: 0, alpha: 1)
        assist.layer.borderColor = UIColor.whiteColor().CGColor
        assist.layer.borderWidth = 1
        assist.setTitle("Assist", forState: .Normal)
        
        pass = UIButton(frame: CGRect(x: Int(self.bounds.width/3), y: areaStart + areaHeight*7/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        pass.addTarget(self, action: "pass:", forControlEvents: .TouchUpInside)
        pass.backgroundColor = UIColor(red: 125/250, green: 0, blue: 0, alpha: 1)
        pass.layer.borderColor = UIColor.whiteColor().CGColor
        pass.layer.borderWidth = 1
        pass.setTitle("Pass", forState: .Normal)
        
        passError = UIButton(frame: CGRect(x: 2*Int(self.bounds.width/3), y: areaStart + areaHeight*7/12, width: Int(self.bounds.width/3), height: areaHeight/6))
        passError.addTarget(self, action: "passError:", forControlEvents: .TouchUpInside)
        passError.backgroundColor = UIColor(red: 75/250, green: 0, blue: 0, alpha: 1)
        passError.layer.borderColor = UIColor.whiteColor().CGColor
        passError.layer.borderWidth = 1
        passError.setTitle("Pass Error", forState: .Normal)
        
        addSubview(assist)
        addSubview(pass)
        addSubview(passError)
    }
    
    func createServeButtons(){
        
    }
    
    
    // Increment statistics for attacking
    func hitKill(sender: UIButton){
        print("KILL!")
    }
    
    func hitAttempt(sender: UIButton){
        print("Hit Attempt")
    }
    
    func hitError(sender: UIButton){
        print("Hit Error")
    }
    
    // Increment statistics for blocking
    func blockKill(sender: UIButton){
        print("BLOCK!")
    }
    
    func blockAssist(sender: UIButton){
        print("Block Assist")
    }
    
    func blockError(sender: UIButton){
        print("Block Error")
    }
    
    // Increment statistics for assists and digs
    func assist(sender: UIButton){
        print("ASSIST")
    }
    
    func pass(sender: UIButton){
        print("Pass")
    }
    
    func passError(sender: UIButton){
        print("Passing Error")
    }
    
    
//    // Update frame to the size you want!
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.label.frame = self.bounds
//    }


}
