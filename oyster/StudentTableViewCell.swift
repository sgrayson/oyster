//
//  StudentTableViewCell.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    
    
    
    //MARK: Properties
    
    @IBOutlet weak var studentImageView: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentReplacementBehaviorButton: UIButton!
    @IBOutlet weak var studentTargetBehaviorButton: UIButton!
   
    
    

    
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
