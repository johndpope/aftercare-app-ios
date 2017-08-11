//
//  SplashScreenViewController.swift
//  Aftercare
//
//  Created by Dimitar Grudev on 8/7/17.
//  Copyright © 2017 Dimitar Grudev. All rights reserved.
//

import UIKit

class SplashScreenViewController : UIViewController {
    
    //MARK - IBOutlets
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK - Lifecycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        
    }
    
    fileprivate func setup() {
        
        //MARK - setup the theme
        
        self.signUpButton.setDCBlueTheme(ofType: .ButtonDefault())
        self.signUpButton.titleLabel?.text = NSLocalizedString("Sign Up", comment: "Sign Up button")
        
        self.loginButton.setDCBlueTheme(ofType: .ButtonDefault())
        self.loginButton.titleLabel?.text = NSLocalizedString("Login", comment: "Login button")
        
        
    }
    
}
