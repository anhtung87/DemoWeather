//
//  TempCollectionViewCell.swift
//  DemoWeather
//
//  Created by Hoang Tung on 2/14/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class TempCollectionViewCell: UICollectionViewCell {
  
  let cellView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let timeLabel: CustomLabel = {
    let label = CustomLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textColor = .white
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 16)
    return label
  }()
  
  let statusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  let tempLabel: CustomLabel = {
    let label = CustomLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .center
    label.textColor = .white
    label.font = .systemFont(ofSize: 20)
    return label
  }()
  
  var info: HourTemp? {
    didSet {
      if let info = info {
        timeLabel.text = info.time
        statusImageView.image = UIImage(named: info.imageName)
        tempLabel.text = info.temp
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    setupLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupView() {
    self.addSubview(cellView)
    cellView.addSubview(timeLabel)
    cellView.addSubview(statusImageView)
    cellView.addSubview(tempLabel)
  }
  
  func setupLayout() {
    cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 8).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0).isActive = true
    timeLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0).isActive = true
    timeLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
    
    tempLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12).isActive = true
    tempLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0).isActive = true
    tempLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0).isActive = true
    tempLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    statusImageView.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.5).isActive = true
    statusImageView.heightAnchor.constraint(equalTo: statusImageView.widthAnchor, multiplier: 1).isActive = true
    statusImageView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor, constant: 0).isActive = true
    statusImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 0).isActive = true
  }
}
