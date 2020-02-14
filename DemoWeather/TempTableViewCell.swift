//
//  TempTableViewCell.swift
//  DemoWeather
//
//  Created by Hoang Tung on 2/14/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class TempTableViewCell: UITableViewCell {
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .clear
    return view
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .center
    label.textColor = .white
    label.font = .systemFont(ofSize: 18)
    label.numberOfLines = 0
    return label
  }()
  
  let minTemp: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .center
    label.textColor = .white
    label.font = .systemFont(ofSize: 18)
    return label
  }()
  
  let maxTemp: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = ""
    label.textAlignment = .center
    label.textColor = .white
    label.font = .systemFont(ofSize: 18)
    return label
  }()
  
  let statusImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "")
    imageView.contentMode = .scaleToFill
    return imageView
  }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    self.backgroundColor = .clear
    self.backgroundView = UIView()
    setupView()
    setupLayout()
  }
  
  func setupView() {
    self.addSubview(containerView)
    containerView.addSubview(timeLabel)
    containerView.addSubview(minTemp)
    containerView.addSubview(maxTemp)
    containerView.addSubview(statusImageView)
  }
  
  func setupLayout() {
    containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    
    timeLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
    timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
    timeLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
    timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    
    minTemp.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
    minTemp.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
    minTemp.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    minTemp.widthAnchor.constraint(equalToConstant: 24).isActive = true
    
    maxTemp.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
    maxTemp.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
    maxTemp.trailingAnchor.constraint(equalTo: minTemp.leadingAnchor, constant: -24).isActive = true
    maxTemp.widthAnchor.constraint(equalToConstant: 28).isActive = true
    
    statusImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
    statusImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
    statusImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    statusImageView.widthAnchor.constraint(equalTo: statusImageView.heightAnchor, multiplier: 1).isActive = true
  }
  
}
