//
//  StudentDetailViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 3/28/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit



class StudentDetailViewController: UIViewController {

    
    var targetCounter = 0
    var replacementCounter = 0
    
    
    //MARK: Properties 
    
    @IBOutlet weak var studentDetailImageView: UIImageView!
    
    @IBOutlet weak var studentDetailLabelView: UILabel!
    
    @IBOutlet weak var studentDetailTargetBehaviorButton: UIButton!
    @IBOutlet weak var studentDetailReplacementBehaviorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSetUp()

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
    
    
    func buttonSetUp() {
        studentDetailReplacementBehaviorButton.setTitle("\(replacementCounter)", for: .normal)
        
        studentDetailTargetBehaviorButton.setTitle("\(targetCounter)", for: .normal)
        
        
        
        
    }
    
    
    @IBAction func replacementCounterButtonAction(_ sender: Any) {
        replacementCounter += 1
        buttonSetUp()
    }
    
    @IBAction func targetCounterButtonAction(_ sender: Any) {
        targetCounter += 1
        buttonSetUp()
    }

}
