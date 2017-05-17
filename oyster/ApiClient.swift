//
//  ApiClient.swift
//  oyster
//
//  Created by Batman on 4/20/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import Foundation
import UIKit

class ApiClient {
    
    private var BASE_URL = "http://ec2-52-27-137-236.us-west-2.compute.amazonaws.com:8888/"
    
    func getStudents() -> [Student] {
        let url = URL(string: "\(BASE_URL)students?deviceId=\(getDeviceId())")
        let responseJsonArray = toArray(str: getResponse(url: url))
        var students = [Student]()
        for jsonObj in responseJsonArray! {
            students.append(Student(json: jsonObj)!)
        }
        return students
    }
    
    func getStudent(id: Int) -> Student? {
        let url = URL(string: "\(BASE_URL)student?id=\(id)&deviceId=\(getDeviceId())")
        let responseJson = toJson(str: getResponse(url: url))
        return Student(json: responseJson!)
    }
    
    func setStudent(_ student: Student) {
        let url = URL(string: "\(BASE_URL)student")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = student.toJsonString(deviceId: getDeviceId()).data(using: .utf8)
        URLSession.shared.dataTask(with: request).resume()
    }
    
    private func getResponse(url: URL?) -> String {
        var responseString: String? = nil
        let semaphore = getSemaphore()
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            responseString = String(data: data!, encoding: String.Encoding.utf8)
            semaphore.signal()
        }).resume()
        awaitResult(semaphore)
        return responseString!
    }
    
    private func toArray(str: String) -> [[String: Any]]? {
        if let data = str.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    private func toJson(str: String) -> [String: Any]? {
        if let data = str.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    private func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    private func getSemaphore() -> DispatchSemaphore {
        return DispatchSemaphore(value: 0)
    }
    
    private func awaitResult(_ semaphore: DispatchSemaphore) {
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
}
