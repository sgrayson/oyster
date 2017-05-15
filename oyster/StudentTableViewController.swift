//
//  StudentTableViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit
import os.log


// this class defines the objects and actions of the table view as a whole 

var students = [Student]()


class StudentTableViewController: UITableViewController {
    
    
    
    var targetBehaviors = [TargetBehavior]()
    
    var targetCount = 0
    var replacementCount = 0
    
    //CHANGE THIS TO 'true' to not read/write from database
    var DEBUG = false
    
    var client = ApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = otterThemeColor
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        loadStudents()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        /*
 
 
 let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
 
 
 cell.tapAction = { (cell) in
 self.showAlertForRow(tableView.indexPath(for: cell)!.row)
 }
 
 return cell
 }
 */
        
 
        let cellIdentifier = "StudentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StudentTableViewCell  else {
            fatalError("The dequeued cell is not an instance of StudentTableViewCell.")
        }

        let student = students[indexPath.row]
        
        cell.studentReplacementBehaviorButton.tag = indexPath.row
       // cell.studentReplacementBehaviorButton.layer.cornerRadius = 10
        cell.studentTargetBehaviorButton.tag = indexPath.row
        //cell.studentTargetBehaviorButton.layer.cornerRadius = 10
        //cell.studentImageView.layer.cornerRadius = cell.studentImageView.frame.height/2
        
        
        
        
        cell.replacementBehaviorButtonAction(cell.studentReplacementBehaviorButton)
        
        cell.targetBehaviorButtonAction(cell.studentTargetBehaviorButton)
            
        
        cell.studentNameLabel.text = student.studentName
        cell.studentImageView.image = student.studentPhoto
        
        cell.studentReplacementBehaviorButton.setTitle("\(student.studentReplacementBehavior)", for: .normal)
        
        
        
        guard let behaviorCounter = TargetBehavior(targetBehavior: "\(student.studentTargetBehavior)", targetBehaviorCount: 5, studentsNameBehavior: "\(student.studentName)") else {
            fatalError("error")
        }
        
        

        return cell
    }
 
    
        

    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    var selectedImage : UIImage = #imageLiteral(resourceName: "studentPic1")
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToStudentDetailPage" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let controller = segue.destination as! StudentRecordViewController
                
                controller.image = selectedImage
                
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        // SEAN I want to pass the selected students photo onto the detail page through this function and the prepare for segue function above. Could you help me finish the following code.
        
        // selectedImage = (studnet image connected to the indexpath row selected) im not sure how to connect to each students image
        
        
        
    }
        
    
    
    
    
    //MARK: Actions
    
    @IBAction func unwindToStudentList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? StudentViewController, let student = sourceViewController.student {
            let newIndexPath = IndexPath(row: students.count, section: 0)
            students.append(student)
            if (!DEBUG) {
                // write to database
                client.setStudent(student)
            }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    
    
    //MARK: Private Functions
    
    private func loadStudents() {
        if (DEBUG) {
            guard let student = Student(studentName: "Timmy", studentGrade : "6", studentPhoto : #imageLiteral(resourceName: "studentPic2"), studentTargetBehavior : "Blurting : \(targetCount)", studentReplacementBehavior : "Hand Raise : \(replacementCount)") else {
                fatalError("Unable to instantiate student1")
            }
            students.append(student)
        } else {
            let studentsForDevice = client.getStudents()
            students.append(contentsOf: studentsForDevice)
        }
    }
    
    
    
        
       
    
    
    
    
    
    func updateStudentCount() {
        
    }
    
   

    
}
