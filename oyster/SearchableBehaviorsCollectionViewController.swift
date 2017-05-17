//
//  SearchableBehaviorsCollectionViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/12/17.
//  Copyright © 2017 Otter. All rights reserved.
//

var studentBehaviorsToTrack : [String] = []


import UIKit

private let reuseIdentifier = "Cell"

class SearchableBehaviorsCollectionViewController: UICollectionViewController {
    
    var tempBehaviorArray : [String] = []
    
    var selectedBehavior : String = ""
    var selectedBehaviorDefinition : String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print(targetBehaviorArray.count)
        print(targetBehaviorsDefinition.count)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation
     
     

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    

    // MARK: UICollectionViewDataSource
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> FooterButtonCollectionReusableView
    {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionFooter", for: indexPath as IndexPath) as! FooterButtonCollectionReusableView
        
        footer.newBehaviorButton.layer.cornerRadius = 10
        footer.newBehaviorButton.text = "Create A new Behavior"
        
        return footer
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return targetBehaviorArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        
        
    
        // Configure the cell
        
        cell.myLabel.text = targetBehaviorArray[indexPath.item]
        cell.layer.cornerRadius = 10
        cell.backgroundColor = targetColor
        
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        feedbackTap()
        
        selectedBehavior = targetBehaviorArray[indexPath.item]
        selectedBehaviorDefinition = targetBehaviorsDefinition[indexPath.item]
        
        
        
        performSegue(withIdentifier: "toBehaviorDefinitionPage", sender: nil)
        /*
        if tempBehaviorArray.contains(targetBehaviorArray[indexPath.item]) {
            
            tempBehaviorArray = tempBehaviorArray.filter { $0 != "\(targetBehaviorArray[indexPath.item])"}
            
            
        } else {
            tempBehaviorArray.append(targetBehaviorArray[indexPath.item])
        }
        */
        
        print(tempBehaviorArray)
    }
    
    /*
    
    @IBAction func saveBehaviorChanges(_ sender: Any) {
        
        
        studentBehaviorsToTrack.append(contentsOf: tempBehaviorArray)
        print(studentBehaviorsToTrack)
    }
    
    */

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    /*
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterViewID", for: indexPath as IndexPath)
        
        
        footerView.
        
        
        return footerView
    }
    */
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toBehaviorDefinitionPage" {
            if let indexPath = self.collectionView?.indexPathsForSelectedItems {
                
                let controller = segue.destination as! BehaviorDefinitionPageViewController
                
                controller.selectedBehavior = selectedBehavior
                controller.selectedBehaviorDefinition = selectedBehaviorDefinition
                
            }
        }
    }



}










