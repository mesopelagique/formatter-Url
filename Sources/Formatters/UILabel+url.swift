//
//  UILabel+url.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___

import UIKit
import QMobileUI

extension UILabel {

    @objc dynamic public var urlAction: String? {
        get {
            return self.text
        }
        set {
            self.text = newValue
            if let newValue = newValue,
                let tap = ApplicationOpenAppBeta.openActionTagGesture(text: newValue, kind: .safari) {
                self.isUserInteractionEnabled = true
                self.addGestureRecognizer(tap)
                return
            }
            self.isUserInteractionEnabled = false
        }
    }
}
