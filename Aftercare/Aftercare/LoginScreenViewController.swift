//
//  LoginScreenViewController.swift
//  Aftercare
//
//  Created by Dimitar Grudev on 8/7/17.
//  Copyright © 2017 Dimitar Grudev. All rights reserved.
//

import UIKit

class LoginScreenViewController : UIViewController {
    
    @IBOutlet weak var usernameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var orConnectWithLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    fileprivate func setup() {
        
        //setup forgotPasswordButton theme
        
        forgotPasswordButton.setDCBlueTheme(
            ofType: .ButtonLink(fontSize: Int(UIFont.dntSmallLabelFontSize))
        )
        
        //setup Text Field theme
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left
        
        self.usernameTextField.setDCBlueTheme(ofType: .TextFieldDefaut())
        self.usernameTextField.attributedPlaceholder = NSAttributedString.init(string: NSLocalizedString("username", comment: ""),
                                                                               attributes: [
                                                                                NSForegroundColorAttributeName: UIColor.white,
                                                                                NSFontAttributeName: UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!,
                                                                                NSParagraphStyleAttributeName: paragraph
                                                                               ])
        
        self.passwordTextField.setDCBlueTheme(ofType: .TextFieldDefaut())
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.attributedPlaceholder = NSAttributedString.init(string: NSLocalizedString("password", comment: ""),
                                                                               attributes: [
                                                                                NSForegroundColorAttributeName: UIColor.white,
                                                                                NSFontAttributeName: UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!,
                                                                                NSParagraphStyleAttributeName: paragraph
                                                                                ])
        
        //setup "Or Connect With" Label theme
        
        self.orConnectWithLabel.font = UIFont.dntLatoRegularFontWith(size: UIFont.dntNoteFontSize)
        self.orConnectWithLabel.textColor = .white
        
        //setup logonButton theme
        
        loginButton.setDCBlueTheme(ofType: .ButtonDefault())
        loginButton.titleLabel?.text = NSLocalizedString("Login", comment: "Login button")
        
        //setting social networks buttons themes
        
        facebookButton.setDCBlueTheme(ofType: .ButtonSocialNetworkWith(
                logoNormal: UIImage(named: "fb")!,
                logoHighlighted: UIImage(named: "fb-highlighted")!
            )
        )
        
        twitterButton.setDCBlueTheme(ofType: .ButtonSocialNetworkWith(
                logoNormal: UIImage(named: "twitter")!,
                logoHighlighted: UIImage(named: "twitter-highlighted")!
            )
        )
        
        googlePlusButton.setDCBlueTheme(ofType: .ButtonSocialNetworkWith(
                logoNormal: UIImage(named: "googlePlus")!,
                logoHighlighted: UIImage(named: "googlePlus-highlighted")!
            )
        )
    }
}
