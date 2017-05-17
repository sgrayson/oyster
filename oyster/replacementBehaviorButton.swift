//
//  BehaviorButton.swift
//  oyster
//
//  Created by Jasen Henderson on 4/17/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

@IBDesignable



class replacementBehaviorButton: UIButton {
    
    
    @IBInspectable var isTargetButton: Bool = true
    
    
    @IBInspectable var fillColor: UIColor = replacementColor
    
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
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
