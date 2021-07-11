//
//  UILabel+url.swift
//  ___PACKAGENAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//  ___COPYRIGHT___

import UIKit
import SafariServices // the SFSafariViewController
import QMobileUI // for UIApplication.topViewController, utility to get current top view controller

extension UILabel {

    @objc dynamic public var urlInApp: String? {
        get {
            return self.text
        }
        set {
            if self.gestureRecognizers.isEmpty {
                self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openSafariViewController(_:))))
            }
            self.text = newValue
            self.isUserInteractionEnabled = !(self.text?.isEmpty ?? true)
        }
    }

    @objc public func openSafariViewController(_ sender: UITapGestureRecognizer) {
        if var text = self.text, !text.isEmpty {
            if !text.contains(":/") { // no scheme, add https by default
                text = "https://\(text)"
            }
            if let url = URL(string: text) {
                let safariVC = SFSafariViewController(url: url)
                UIApplication.topViewController?.present(safariVC, animated: true, completion: {
                    // done with safari controller
                })
            }
        } // else nothing to display
    }
}
