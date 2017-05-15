//
//  addNewReplacementViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/15/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class addNewReplacementViewController: UIViewController {

    
    
    
        @IBOutlet weak var newBehaviorTextFeild: UITextField!
        @IBOutlet weak var newBehaviorTextFeildBox: UITextView!
        @IBOutlet weak var addNewBehaviorButton: UIButton!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true            // Do any additional setup after loading the view.
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
        
        
        
        @IBAction func saveNewBehavior(_ sender: Any) {
            
            
            replacementBehaviorArray.append(newBehaviorTextFeild.text!)
            
            
        }
    
    
    
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
        
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            
            
            
            
        }
        
        
}

