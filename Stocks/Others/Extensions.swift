//
//  Extensions.swift
//  Stocks
//
//  Created by VenD on 7/15/21.
//

import Foundation
import UIKit

// MARK:- Framing

extension UIView {
    var widht: CGFloat {
        frame.size.width
    }
    
    var height: CGFloat {
        frame.size.height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        left + widht
    }
    
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        top + height
    }
}



