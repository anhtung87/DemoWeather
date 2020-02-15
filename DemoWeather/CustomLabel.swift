//
//  CustomLabel.swift
//  DemoWeather
//
//  Created by Hoang Tung on 2/14/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.text = ""
    self.textAlignment = .center
    self.textColor = .white
    
    self.layer.masksToBounds = false
    self.layer.shadowRadius = 20.0
    self.layer.shadowOpacity = 1
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 0)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
