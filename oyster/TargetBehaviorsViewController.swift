//
//  TargetBehaviorsViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/11/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class TargetBehaviorsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    
    
    @IBOutlet weak var newBehaviorLabel: UILabel!
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String,
            at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
        withReuseIdentifier: "behaviorHeader",
                    for: indexPath) as! CollectionReusableView
        headerView.behaviorsTitleLabel.text = "Target Behaviors"
        return headerView
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return targetBehaviorArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        cell.myLabel.text = targetBehaviorArray[indexPath.item]
        cell.layer.cornerRadius = 10
        cell.backgroundColor = unselectedButtonColor
        
        if newBehaviorForPlan.contains(targetBehaviorArray[indexPath.item]) {
        
            cell.backgroundColor = targetColor
            
        } else {
            cell.backgroundColor = unselectedButtonColor
        }
        
        
        
        
        // make cell more visible in our example project
        //cell.
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        // handle tap events
        feedbackTap()
        
        
        
        
        
        if newBehaviorForPlan.contains(targetBehaviorArray[indexPath.item]) {
          newBehaviorForPlan = newBehaviorForPlan.filter { $0 != "\(targetBehaviorArray[indexPath.item])"}
            cell?.isSelected = false
            
        } else {
            newBehaviorForPlan.append(targetBehaviorArray[indexPath.item])
            cell?.isSelected = true
        }
        
        
    
        print(newBehaviorForPlan)
        
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = pressingColor
    }
    
    // change background color back when user releases touch
     func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
       
        if cell?.isSelected == false {
            
        }
 
}
}
