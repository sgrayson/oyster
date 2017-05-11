//
//  ReplacementBehaviorViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/10/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class ReplacementBehaviorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var newBehaviorForPlan : [String] = []
    
    @IBOutlet weak var newBehaviorLabel: UILabel!
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return replacementBehaviorArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        cell.myLabel.text = replacementBehaviorArray[indexPath.item]
        //cell.backgroundColor = UIColor.green // make cell more visible in our example project
        //cell.
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        newBehaviorForPlan.append("\(replacementBehaviorArray[indexPath.item])")
        studentReplacementBehaviorsArray.append("\(replacementBehaviorArray[indexPath.item])")
        print(newBehaviorForPlan)
        newBehaviorLabel.text = "You added \(newBehaviorForPlan.last!) as a rep behavior to Timmy's Plan"
        
        
    }
}
