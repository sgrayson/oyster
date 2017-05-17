//
//  AthenticationViewController.swift
//  otterApp
//
//  Created by Jasen Henderson on 3/6/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit
import LocalAuthentication

class AthenticationViewController: UIViewController {
    
    @IBOutlet weak var loginGreatingLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        //authenticateUser()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // enable touch ID here
    
    
    
    
    
    
    
    let kMsgShowFinger = ""
    let kMsgShowReason = "Try to dismiss this screen"
    let kMsgFingerOK = "Login successful"
    
    var context = LAContext()
    
    private func setupController() {
        
    }
    
    func updateUI() {
        var policy: LAPolicy?
        // Depending the iOS version we'll need to choose the policy we are able to use
        if #available(iOS 9.0, *) {
            // iOS 9+ users with Biometric and Passcode verification
            policy = .deviceOwnerAuthentication
        } else {
            // iOS 8+ users with Biometric and Custom (Fallback button) verification
            context.localizedFallbackTitle = "Password"
            policy = .deviceOwnerAuthenticationWithBiometrics
        }
        
        var err: NSError?
        
        // Check if the user is able to use the policy we've selected previously
        guard context.canEvaluatePolicy(policy!, error: &err) else {
            
            // Print the localized message received by the system
            loginGreatingLabel.text = err?.localizedDescription
            return
        }
        
        // Great! The user is able to use his/her Touch ID 👍
        
        loginGreatingLabel.text = kMsgShowFinger
        
        loginProcess(policy: policy!)
    }
    
    private func loginProcess(policy: LAPolicy) {
        
        // Start evaluation process with a callback that is executed when the user ends the process successfully or not
        context.evaluatePolicy(policy, localizedReason: kMsgShowReason, reply: { (success, error) in
            DispatchQueue.main.async {
                self.performSegue (withIdentifier: "loginSucessSegue", sender: self)
                UIView.animate(withDuration: 0.5, animations: {
                    
                })
                
                guard success else {
                    guard let error = error else {
                        
                        return
                    }
                    switch(error) {
                    case LAError.authenticationFailed:
                        self.loginGreatingLabel.text = "Not sure we know who you are yet"
                    case LAError.userCancel:
                        self.loginGreatingLabel.text = "Looks like you quit on us"
                        // Fallback button was pressed and an extra login step should be implemented for iOS 8 users.
                    // By the other hand, iOS 9+ users will use the pasccode verification implemented by the own system.
                    case LAError.userFallback:
                        self.loginGreatingLabel.text = "You chose to enter your password"
                    case LAError.systemCancel:
                        self.loginGreatingLabel.text = "Looks like your phone canceled on you"
                    case LAError.passcodeNotSet:
                        self.loginGreatingLabel.text = "Looks like you dont have a password set"
                    case LAError.touchIDNotAvailable:
                        self.loginGreatingLabel.text = "Looks like Touch ID is not available on your device."
                    case LAError.touchIDNotEnrolled:
                        self.loginGreatingLabel.text = "Looks like Touch ID has no enrolled fingers."
                    // iOS 9+ functions
                    case LAError.touchIDLockout:
                        self.loginGreatingLabel.text = "There were too many failed Touch ID attempts and Touch ID is now locked."
                    case LAError.appCancel:
                        self.loginGreatingLabel.text = "Authentication was canceled by application."
                    case LAError.invalidContext:
                        self.loginGreatingLabel.text = "LAContext passed to this call has been previously invalidated."
                    // MARK: IMPORTANT: There are more error states, take a look into the LAError struct
                    default:
                        self.loginGreatingLabel.text = "Touch ID may not be configured"
                        break
                    }
                    return
                }
                
            }
        })
    }
    
    private func showUnexpectedErrorMessage() {
        
        loginGreatingLabel.text = "Unexpected error"
    }
    
}





