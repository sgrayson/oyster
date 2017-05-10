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
    var items = ["Blurt", "Running", "crying", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48"]
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        cell.myLabel.text = self.items[indexPath.item]
        cell.backgroundColor = UIColor.green // make cell more visible in our example project
        //cell.
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        newBehaviorForPlan.append("\(items[indexPath.item])")
        print(newBehaviorForPlan)
        newBehaviorLabel.text = "You added \(newBehaviorForPlan.last!) as a rep behavior to Timmy's Plan"
        
    }
}
