//
//  StudentRecordViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/10/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class StudentRecordViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //target counter should save somehow to database 
    var targetCounter = 0
    
    var replacementCounter = 0
    
    var image : UIImage = #imageLiteral(resourceName: "studentPic1")
    
    @IBOutlet weak var studentTargetBehaviorButton: BehaviorButton!
    @IBOutlet weak var studentReplacementBehaviorButton: replacementBehaviorButton!
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {}
    
    @IBOutlet weak var studentProfileImage: UIImageView!
    
    override func viewDidLoad() {
        
        
        //target counter should save somehow to database
        //Name should pull from the specific students target
        studentTargetBehaviorButton.setTitle("Target: \(targetCounter)", for: .normal)
        
        //rep counter should save somehow to database
        //Name should pull from the specific students rep
        
        studentReplacementBehaviorButton.setTitle("Replacment: \(replacementCounter)", for: .normal)
        
        
        studentProfileImage.image = image
        
        studentProfileImage.layer.cornerRadius = studentProfileImage.frame.height/2
        studentTargetBehaviorsArray = studentBehaviorsToTrack
        
        if targetBehaviorArray.count != studentTargetBehaviorsArray.count{
            
            let difference = studentTargetBehaviorsArray.count - targetBehaviorCount.count
            
            for _ in 0..<difference{
                targetBehaviorCount.append(0)
            }
        } else {
            print("equal")
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
    }
    
    
    
    @IBOutlet weak var newBehaviorLabel: UILabel!
    
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return studentTargetBehaviorsArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        
        cell.myLabel.text = "\(studentTargetBehaviorsArray[indexPath.item]): \(targetBehaviorCount[indexPath.item])"
        cell.layer.cornerRadius = 10
        cell.backgroundColor = targetColor
        //cell.backgroundColor = UIColor.green // make cell more visible in our example project
        //cell.
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    /*
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        feedbackTap()
        
        targetBehaviorCount[indexPath.item] += 1
        
      */
   
    @IBAction func targetCounterButton(_ sender: Any) {
        
        targetCounter += 1
        studentTargetBehaviorButton.setTitle("Target: \(targetCounter)", for: .normal)
        
    }


    
    @IBAction func replacementCounterButtonAction(_ sender: Any) {
        replacementCounter += 1
        studentReplacementBehaviorButton.setTitle("Replacement: \(replacementCounter)", for: .normal)
        
    }





}








