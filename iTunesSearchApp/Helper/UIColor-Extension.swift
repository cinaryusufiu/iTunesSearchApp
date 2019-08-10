//
//  UIColor-Extension.swift
//  Menu
//
//  Created by Yusuf Çınar on 25.05.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let baseColor : UIColor = {
        return UIColor(red:245/255.0, green:45/255.0, blue:86/255.0,  alpha:1)
    }()
    static var whiteSmoke : UIColor {
        return UIColor(red:244/255.0, green:244/255.0, blue:246/255.0,  alpha:1)
    }
    static var whiteGhost : UIColor {
        return UIColor(red:248/255.0, green:249/255.0, blue:249/255.0,  alpha:1)
    }
   
    static func rgb(red :  CGFloat , green :  CGFloat , blue : CGFloat) -> UIColor {
        return  UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    static var random: UIColor {
        let r:CGFloat  = .random(in: 0 ... 1)
        let g:CGFloat  = .random(in: 0 ... 1)
        let b:CGFloat  = .random(in: 0 ... 1)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

