//
//  ReplacementBehavior.swift
//  oyster
//
//  Created by Jasen Henderson on 3/29/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class replacementBehavior {
    
    var studentsNameBehaviorR : String
    var replacementBehavior : String
    var replacementBehaviorCount : Int
    
    
    
    init?(replacementBehavior : String, replacementBehaviorCount : Int, studentsNameBehaviorR : String) {
        
        if replacementBehavior.isEmpty{
            return nil
    }
    
    
    self.replacementBehavior = replacementBehavior
    self.replacementBehaviorCount = replacementBehaviorCount
    self.studentsNameBehaviorR = studentsNameBehaviorR
        
    
}
}
