//
//  StudentTableViewCell.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit


// this class defines what objects and action are in each table view cell


class StudentTableViewCell: UITableViewCell {

    var tapAction: ((UITableViewCell) -> Void)?
    
    
    
    
    
    
    
    //MARK: Properties
    
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentReplacementBehaviorButton: UIButton!
    @IBOutlet weak var studentTargetBehaviorButton: UIButton!
   
    
    
    @IBAction func replacementBehaviorButtonAction(_ sender: Any) {
        
        let buttonRow = studentReplacementBehaviorButton.tag
        
        var replacementCount = 0
        replacementCount += 1
        
        studentReplacementBehaviorButton.setTitle("\(buttonRow): \(replacementCount)", for: .normal)
        
    }
    

    @IBAction func targetBehaviorButtonAction(_ sender: Any) {
        
        let buttonRow = studentTargetBehaviorButton.tag
        
        var targetCount = 0
        targetCount += 1
        
        studentTargetBehaviorButton.setTitle("\(buttonRow): \(targetCount)", for: .normal)
    }
    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
