//
//  UIColor-Extension.swift
//  ChatAppWithFirebase
//
//  Created by takuro on 2020/07/08.
//  Copyright © 2020 takuro. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        
    }
    
}
