//
//  Student.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit

// this is a class to allow the creation and display of students information

class Student {
    
    var idOpt: Int?
    var studentName : String
    var studentGrade : String
    var studentPhoto : UIImage?
    var studentTargetBehavior : String
    var studentReplacementBehavior : String
    
    init?(studentName: String, studentGrade : String, studentPhoto : UIImage?, studentTargetBehavior : String, studentReplacementBehavior : String) {
        
        if studentName.isEmpty {
            return nil
        }

        self.studentName = studentName
        self.studentGrade = studentGrade
        self.studentPhoto = studentPhoto
        self.studentTargetBehavior = studentTargetBehavior
        self.studentReplacementBehavior = studentReplacementBehavior
    }
    
    init?(json: [String: Any]) {
        self.idOpt = json["id"] as? Int
        self.studentName = json["name"] as! String
        self.studentGrade = json["grade"] as! String
        //TODO(sgrayson): just hard-code this for now
        self.studentPhoto = #imageLiteral(resourceName: "studentPic2")
        self.studentTargetBehavior = json["target_behavior"] as! String
        self.studentReplacementBehavior = json["replacement_behavior"] as! String
    }
    
    //TODO(sgrayson): need to do this better
    func toJsonString(deviceId: String) -> String {
        var idJson = ""
        if let id = idOpt {
            idJson = "\"id\":\(id),"
        }
        return "{" + idJson +
            "\"deviceId\":\"\(deviceId)\"," +
            "\"name\":\"\(self.studentName)\"," +
            "\"grade\":\"\(self.studentGrade)\"," +
            "\"targetBehavior\":\"\(self.studentTargetBehavior)\"," +
            "\"replacementBehavior\":\"\(self.studentReplacementBehavior)\"" +
        "}"
    }
    
    func toString() -> String {
        return self.studentName
    }
}







