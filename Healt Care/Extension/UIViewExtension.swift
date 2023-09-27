//
//  UIViewExtension.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation
import UIKit

extension UIView {

  func dropShadow() {
      layer.shadowColor = UIColor.gray.cgColor
      layer.shadowOpacity = 0.24
      layer.masksToBounds = false
      layer.shadowOffset = CGSize(width: 0, height: 16)
      layer.shadowRadius = 30
  }
}
