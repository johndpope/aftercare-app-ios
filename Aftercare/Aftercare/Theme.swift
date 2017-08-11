//
//  Theme.swift
//  Aftercare
//
//  Created by Dimitar Grudev on 8/2/17.
//  Copyright © 2017 Dimitar Grudev. All rights reserved.
//

import Foundation
import UIKit

// Color palette

extension UIColor {
    class var dntBrightSkyBlue: UIColor {
        return UIColor(red: 10.0 / 255.0, green: 201.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    
    class var dntCeruleanBlue: UIColor {
        return UIColor(red: 10.0 / 255.0, green: 93.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
    }
    
    class var dntIceBlue: UIColor {
        return UIColor(red: 251.0 / 255.0, green: 253.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var dntPaleSkyBlue: UIColor {
        return UIColor(red: 201.0 / 255.0, green: 235.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
}

//MARK - UIFonts

extension UIFont {
    
    static let dntButtonFontSize: CGFloat = 20
    static let dntTitleFontSize: CGFloat = 32
    static let dntLabelFontSize: CGFloat = 15
    static let dntSmallLabelFontSize: CGFloat = 13
    static let dntNoteFontSize: CGFloat = 12
    
    class func dntLatoRegularFontWith(size: CGFloat) -> UIFont? {
        return UIFont(name: "Lato-Regular", size: size)
    }
    
    class func dntLatoLightFont(size: CGFloat) -> UIFont? {
        return UIFont(name: "Lato-Light", size: size)
    }
    
}

//MARK - Components themes defined

enum DCBlueThemeTypes {
    case ButtonDefault()
    case ButtonDefaultWith(size: CGSize)
    case ButtonLink(fontSize: Int)
    case ButtonSocialNetworkWith(logoNormal: UIImage, logoHighlighted: UIImage)
    case TextFieldDefaut()
}

//MARK: - Component Theme Definitions

extension UIButton: Themeable {
    
    //MARK: - Themeable
    
    func setDCBlueTheme(ofType type: DCBlueThemeTypes) {
        
        //Make sure that the button that we want to customize is from type Custom
        if self.buttonType != .custom {
            print("Error: Trying to apply custom style to \(self.buttonType) type of a Button")
            return
        }
        
        switch type {
        case .ButtonDefaultWith(let size):
            applyDefaultButtonStyle(width: size.width, height: size.height)
            return
        case .ButtonDefault():
            applyDefaultButtonStyle(width: 280, height: 50)
            return
        case .ButtonLink(let size):
            applyLinkButtonStyle(fontSize: size)
            return
        case .ButtonSocialNetworkWith(let logoNormal, let logoHighlighted):
            applySocialNetworkButton(logoNormal: logoNormal, logoHighlighted: logoHighlighted)
            return
        default:
            return
        }
    }
    
    func applyDefaultButtonStyle(width: CGFloat, height: CGFloat) {
        
        //common settings
        self.layer.cornerRadius = height / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1 / UIScreen.main.scale
        self.layer.masksToBounds = true
        
        self.titleLabel?.font = UIFont.dntLatoRegularFontWith(size: UIFont.dntButtonFontSize)
        
        //normal state settings
        self.setTitleColor(.white, for: .normal)
        
        //highlighted state settings
        self.setTitleColor(.dntCeruleanBlue, for: .highlighted)
        
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.colors = [UIColor.dntIceBlue.cgColor, UIColor.dntPaleSkyBlue.cgColor]
        layer.startPoint = CGPoint(x: 0.0, y: 0.5)
        layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        let focusedImage: UIImage?
        
        UIGraphicsBeginImageContext(layer.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        focusedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(focusedImage!, for: .highlighted)
    }
    
    func applyLinkButtonStyle(fontSize size: Int) {
        
        //normal state settings
        //self.titleLabel?.font = UIFont.dntLatoLightFont(size: UIFont.dntSmallLabelFontSize)
        self.setTitleColor(.white, for: .normal)
        
        //highlighted state settings
        self.setTitleColor(UIColor.dntCeruleanBlue, for: .highlighted)
        
        //common settings
        self.titleLabel?.font = UIFont.dntLatoLightFont(size: CGFloat(size))
        
    }
    
    func applySocialNetworkButton(logoNormal: UIImage, logoHighlighted:UIImage) {
        
        //common settings
        self.layer.masksToBounds = true
        self.setTitle("", for: .normal)
        
        //normal state settings
        self.setImage(logoNormal, for: .normal)
        
        //highlited state settings
        self.setImage(logoHighlighted, for: .highlighted)
    }
    
}
    
extension SkyFloatingLabelTextField: Themeable {
    
    func setDCBlueTheme(ofType type: DCBlueThemeTypes) {
        
        switch type {
        case .TextFieldDefaut():
            applyTextFieldStyle()
            return
        default:
            return
        }
        
    }
    
    func applyTextFieldStyle() {
        
        //common style settings
        self.placeholderFont = UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)!
        self.placeholderColor = .white
        self.titleColor = .white
        self.selectedTitleColor = .white
        self.lineColor = .white
        self.lineHeight = 1 / UIScreen.main.scale
        self.selectedLineColor = .white
        self.selectedLineHeight = 1 / UIScreen.main.scale
        self.layoutSubviews()
        self.updateColors()
        
        //override default titleFormatter to not return uppercased text
        self.titleFormatter = { text in
            return text
        }
        
        //set color background and font
        self.backgroundColor = .clear
        self.font = UIFont.dntLatoLightFont(size: UIFont.dntLabelFontSize)
        self.textColor = .white
        self.borderStyle = .none
        
        //draw botton line of the TextField
//        let width = CGFloat(1.0 / UIScreen.main.scale)
//        let border = CALayer()
//        border.borderColor = UIColor.white.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: width)
//        border.borderWidth = width
//        
//        //add border as a child to the layer
//        self.layer.addSublayer(border)
    }
    
}

//MARK - Protocols
    
protocol Themeable {
    
    //must be implemented
    func setDCBlueTheme(ofType type: DCBlueThemeTypes) //optional
    
    //optional methods
    func applyDefaultButtonStyle(width: CGFloat, height: CGFloat)
    func applyLinkButtonStyle(fontSize: Int)
    func applySocialNetworkButton(logoNormal: UIImage, logoHighlighted:UIImage)
    func applyTextFieldStyle()
}

// Define default definitions for optional methods in the Themeable protocol
extension Themeable {
    func applyDefaultButtonStyle(width: CGFloat, height: CGFloat) { }//default
    func applyLinkButtonStyle(fontSize: Int) { }//default
    func applySocialNetworkButton(logoNormal: UIImage, logoHighlighted:UIImage) { }//default
    func applyTextFieldStyle() { }//default
}
