//
//  BehaviorDefinitionPageViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/14/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class BehaviorDefinitionPageViewController: UIViewController {
    
    @IBOutlet weak var behaviorNameLabel: UILabel!
    
    @IBOutlet weak var behaviorDefinitionTextView: UITextView!
    
    @IBOutlet weak var AddBehaviorButton: UIButton!
    var selectedBehavior: String = "Anonymous"

    var selectedBehaviorDefinition : String = "Definition"
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        behaviorNameLabel.text = "\(selectedBehavior)"
        behaviorDefinitionTextView.text = "\(selectedBehaviorDefinition)"
        
        AddBehaviorButton.setTitle("Add Behavior to Plan", for: .normal)
        AddBehaviorButton.layer.cornerRadius = 10
        
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func AddBehaviorButton(_ sender: Any) {
        
        if tempCreatingPlan.count == 0 {
            tempCreatingPlan.append(selectedBehavior)
            print(tempCreatingPlan)
            studentTargetBehaviorsArray.append(tempCreatingPlan[0])
            
        } else if tempCreatingPlan.count == 1 {
            tempCreatingPlan.append(selectedBehavior)
            
            
            studentReplacementBehaviorsArray.append(tempCreatingPlan[1])
            
            print(tempCreatingPlan)
            tempCreatingPlan.remove(at: 0)
            tempCreatingPlan.remove(at: 0)
            print(tempCreatingPlan)
            
            
            }
            }
        }
        
        
    

