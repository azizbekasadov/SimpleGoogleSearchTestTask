//
//  UIView+Extension.swift
//  SimpleGoogleSearchTestTask
//
//  Created by Azizbek Asadov on 23/01/23.
//

import UIKit.UIView

extension UIView {
    
    @objc
    public func localize() {
        for view in self.subviews {
            view.localize()
        }
    }
    
    @objc
    public func colorize() {
        for view in self.subviews {
            view.colorize()
        }
    }
}
