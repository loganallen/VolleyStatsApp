//
//  MatchSimulationViewController.swift
//  VolleyStats
//
//  Created by Logan Allen on 12/18/15.
//  Copyright © 2015 loganallen. All rights reserved.
//

import UIKit

class MatchSimulationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    var playerArray: [Player] = []
    
    lazy var collectionView: UICollectionView = {
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        let cv: UICollectionView = UICollectionView(frame: CGRect(x: 0.0, y: height/4 + 4, width: width, height: height*3/4 - 4), collectionViewLayout: self.flowLayout)
        cv.dataSource = self
        cv.center = self.view.center
        cv.delegate = self
        //cv.bounces = true
        //cv.alwaysBounceVertical = true
        // Size of colleciton view will MATCH size of window given
        cv.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        cv.registerClass(PlayerCell.self, forCellWithReuseIdentifier: "PlayerCell")
        cv.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        return cv
    }()
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 1
        return flow
    }()
    
    override func viewDidLoad() {
        //TODO:
        print("Hello")
        
        title = "Match!"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "addTapped")
        view.addSubview(self.collectionView)
        
        playerArray.append(Player(first: "Logan", last: "Allen", jersey: 1, pic: "la"))
        playerArray.append(Player(first: "Anthony", last: "Point", jersey: 2, pic: "ap"))
        playerArray.append(Player(first: "Matty", last: "Ormseth", jersey: 3, pic: "mo"))
        playerArray.append(Player(first: "Brad", last: "Tiller", jersey: 4, pic: "bt"))
        playerArray.append(Player(first: "Alec", last: "Dean", jersey: 5, pic: "ad"))
        playerArray.append(Player(first: "James", last: "Alvarez", jersey: 6, pic: "ja"))
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    // Determine Size of each player Cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let w = floor(collectionView.bounds.width/3)
        let h = floor(collectionView.bounds.height/2) - 1
        return CGSize(width: w, height: h)
    }
    
    // Determine number of player cells in the grid (6)
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    // Initialize each player cell in collection view
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell
        
        return cell
    }
    
}
