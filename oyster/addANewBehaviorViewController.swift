//
//  addANewBehaviorViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 5/14/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class addANewBehaviorViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var newBehaviorTextFeild: UITextField!
    @IBOutlet weak var newBehaviorTextFeildBox: UITextView!
    @IBOutlet weak var addNewBehaviorButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.navigationController?.navigationBar.tintColor = otterGreyColor
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
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
    
    
    
    @IBAction func saveNewBehavior(_ sender: Any) {
        
        
        targetBehaviorArray.append(newBehaviorTextFeild.text!)
        targetBehaviorsDefinition.append(newBehaviorTextFeildBox.text!)
        
        
    }
    
    
    
    
    func textViewShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        
        
        
    }
    
    func newBehaviorTextFeildBox(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    
}
