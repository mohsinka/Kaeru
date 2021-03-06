//
//  Helper.swift
//  Kaeru
//
//  Created by kingkong999yhirose on 2016/07/29.
//  Copyright © 2016年 kingkong999yhirose. All rights reserved.
//

import UIKit
import CoreImage

internal extension UIViewController {
    func snapShotFromWindow() -> UIImage? {
        return view.snapShotFromWindow()
    }
}

internal extension UIView {
    func snapShotFromWindow() -> UIImage {
        guard let window = UIApplication.sharedApplication().keyWindow else {
            fatalError()
        }
        
        UIGraphicsBeginImageContextWithOptions(window.frame.size, false, 1)
        window.drawViewHierarchyInRect(window.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

internal extension UIView {
    func configureSnapShotLayer() {
        layer.cornerRadius = 4.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowOpacity = 0.7
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowRadius = 5
    }
}


internal extension UIView {
    func addWholeConstraint(view: UIView) {
        [.Top, .Bottom, .Left, .Right].forEach {
            NSLayoutConstraint(
                item: self,
                attribute: $0,
                relatedBy: .Equal,
                toItem: view,
                attribute: $0,
                multiplier: 1,
                constant: 0)
                .active = true
        }
    }
    
}

internal extension UIView {
    var className: String {
        let className = NSStringFromClass(self.dynamicType)
        let range = className.rangeOfString(".")
        return className.substringFromIndex(range!.endIndex)
    }
    class var className: String {
        let className = NSStringFromClass(self)
        let range = className.rangeOfString(".")
        return className.substringFromIndex(range!.endIndex)
    }
}

internal extension Array {
    mutating func removeToLast(from index: Int) {
        removeRange(index..<count)
    }
    mutating func removeToLastIfPossible(from index: Int) {
        if index >= count {
            return
        }
        removeToLast(from: index)
    }
}