//
//  Student.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

class Student {
    
    var studentName : String
    var studentGrade : Int?
    var studentPhoto : UIImage?
    var studentTargetBehavior : String
    var studentReplacementBehavior : String
    
    
    
    
    init?(studentName: String, studentGrade : Int?, studentPhoto : UIImage?, studentTargetBehavior : String, studentReplacementBehavior : String) {
        
        if studentName.isEmpty {
            return nil
        }

    self.studentName = studentName
        self.studentGrade = studentGrade
        self.studentPhoto = studentPhoto
        self.studentTargetBehavior = studentTargetBehavior
        self.studentReplacementBehavior = studentReplacementBehavior
        
        
    
    
    }
    
    
    
}
