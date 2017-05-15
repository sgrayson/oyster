//
//  StudentViewController.swift
//  oyster
//
//  Created by Jasen Henderson on 3/27/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit
import os.log




class StudentViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    
    var targetCount = 0
    var replacmentCount = 0

    
    
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var student: Student?
    
    //MARK: Properties
    
    
    @IBOutlet weak var studentNameTextLabel: UITextField!
    @IBOutlet weak var studentGradeTextFeild: UITextField!
    @IBOutlet weak var studentTargetBehaviorTextFeild: UITextField!
    @IBOutlet weak var studentReplacementBehaviorTextFeild: UITextField!
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = otterThemeColor
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
         navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        updateSaveButtonState()
        
        // Do any additional setup after loading the view.
        
        studentNameTextLabel.delegate = self
        studentGradeTextFeild.delegate = self
        studentTargetBehaviorTextFeild.delegate = self
        studentReplacementBehaviorTextFeild.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        
        saveButton.isEnabled = true

        
    }
    
    
    
    
    
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        pictureImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Navigation
    
   
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let studentName = studentNameTextLabel.text ?? ""
        let studentPhoto = pictureImageView.image
        let studentGrade = studentGradeTextFeild.text
        let studentTargetBehavior = studentTargetBehaviorTextFeild.text
        let studentReplacementBehavior = studentReplacementBehaviorTextFeild.text
        
        
        
        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        student = Student(studentName: studentName, studentGrade : studentGrade!, studentPhoto : studentPhoto, studentTargetBehavior : "\(studentTargetBehavior!) : \(targetCount)", studentReplacementBehavior : "\(studentReplacementBehavior!) : \(replacmentCount)")
        
        
    }
    
    
    //MARK: Action
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        studentNameTextLabel.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultTextLabelButton(_ sender: Any) {
        
    }

    
    //MARK: Private methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = studentNameTextLabel.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
}


