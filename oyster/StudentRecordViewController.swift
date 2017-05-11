//
//  StudentRecordViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/10/17.
//  Copyright © 2017 Otter. All rights reserved.
//



var studentReplacementBehaviorsArray: [String] = ["Swearing", "Arguing"]

var replacementBehaviorArray : [String] = ["Raise Hand", "Request Break", "Something", "Otter Something"]

var behaviorCount : [Int] = []

import UIKit

class StudentRecordViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    override func viewDidLoad() {
        if behaviorCount.count != studentReplacementBehaviorsArray.count{
            
            let difference = studentReplacementBehaviorsArray.count - behaviorCount.count
            
        for _ in 0..<difference{
        behaviorCount.append(0)
        }
        } else {
            print("equal")
        }
    }
    
    var newBehaviorForPlan : [String] = []
    
    @IBOutlet weak var newBehaviorLabel: UILabel!
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentReplacementBehaviorsArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        cell.myLabel.text = "\(studentReplacementBehaviorsArray[indexPath.item]): \(behaviorCount[indexPath.item])"
        //cell.backgroundColor = UIColor.green // make cell more visible in our example project
        //cell.
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        behaviorCount[indexPath.item] += 1
        
        
        
        
    }
}
