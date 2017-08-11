//
//  SignUpScreenViewController.swift
//  Aftercare
//
//  Created by Dimitar Grudev on 8/7/17.
//  Copyright © 2017 Dimitar Grudev. All rights reserved.
//

import UIKit

class SignUpScreenViewController : UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var uploadUserAvatarButton: UIButton!
    @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var connectWithLabel: UILabel!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var googlePlusButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    fileprivate func setup() {
        
        //setup theme styles
        
        signUpLabel.font = UIFont.dntLatoLightFont(size: UIFont.dntTitleFontSize)
        signUpLabel.textColor = .white
        
        //setup text fields theme styles
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .left
        
        nameTextField.setDCBlueTheme(ofType: .TextFieldDefaut())
        nameTextField.attributedPlaceholder = NSAttributedString.init(string: NSLocalizedString("Name", comment: ""),
            attributes: [
                NSForegroundColorAttributeName: UIColor.white,
                NSFontAttributeName: UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!,
                NSParagraphStyleAttributeName: paragraph
            ]
        )
        
        emailTextField.setDCBlueTheme(ofType: .TextFieldDefaut())
        emailTextField.attributedPlaceholder = NSAttributedString.init(string: NSLocalizedString("Email", comment: ""),
            attributes: [
                NSForegroundColorAttributeName: UIColor.white,
                NSFontAttributeName: UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!,
                NSParagraphStyleAttributeName: paragraph
            ]
        )
        
        passwordTextField.setDCBlueTheme(ofType: .TextFieldDefaut())
        passwordTextField.isSecureTextEntry = true
        passwordTextField.attributedPlaceholder = NSAttributedString.init(string: NSLocalizedString("Password", comment: ""),
            attributes: [
                NSForegroundColorAttributeName: UIColor.white,
                NSFontAttributeName: UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!,
                NSParagraphStyleAttributeName: paragraph
            ]
        )
        
        createButton.setDCBlueTheme(ofType: .ButtonDefault())
        createButton.titleLabel?.text = NSLocalizedString("Create", comment: "Create new user account button label")
        
        //setting social media buttons and a label
        
        connectWithLabel.font = UIFont.dntLatoRegularFontWith(size: UIFont.dntNoteFontSize)
        connectWithLabel.textColor = .white
        
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
