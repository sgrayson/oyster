//
//  circleButton.swift
//  oyster
//
//  Created by Jasen Henderson on 5/15/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import Foundation


//
//  BehaviorButton.swift
//  oyster
//
//  Created by Jasen Henderson on 4/17/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

@IBDesignable



class circleButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = targetColor
    @IBInspectable var isTargetButton: Bool = true
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: frame.height/2)
        fillColor.setFill()
        path.fill()
        
        
        
        /*
         // Only override draw() if you perform custom drawing.
         // An empty implementation adversely affects performance during animation.
         override func draw(_ rect: CGRect) {
         // Drawing code
         }
         */
        
        
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
