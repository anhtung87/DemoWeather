//
//  ViewController.swift
//  DemoWeather
//
//  Created by Hoang Tung on 2/14/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var fakeHourInfo: [HourTemp]?
  var fakeDayInfo: [DayTemp]?
  
  let backgroundView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "background")
    return imageView
  }()
  
  let topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let locationLabel: CustomLabel = {
    let label = CustomLabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Hà Nội"
    label.font = .boldSystemFont(ofSize: 36)
    return label
  }()
  
  let statusLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Trời quang mây"
    label.font = .systemFont(ofSize: 18)
    return label
  }()
  
  let temperatureLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "25º"
    label.font = .systemFont(ofSize: 96)
    return label
  }()
  
  let weekdayLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "Thứ Sáu"
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  let dayLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "HÔM NAY"
    label.font = .boldSystemFont(ofSize: 16)
    return label
  }()
  
  let maxTempLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "28"
    label.font = .systemFont(ofSize: 20)
    return label
  }()
  
  let minTempLabel: CustomLabel = {
    let label = CustomLabel()
    label.text = "21"
    label.font = .systemFont(ofSize: 20)
    return label
  }()
  
  let temperatureCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.layer.borderColor = UIColor.white.cgColor
    collectionView.layer.borderWidth = 0.5
    collectionView.backgroundView = UIView()
    collectionView.backgroundColor = .clear
    collectionView.register(TempCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return collectionView
  }()
  
  let timeTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundView = UIView()
    tableView.backgroundColor = .clear
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
    setupView()
    setupLayout()
    setupCollectionView()
    setupTableView()
  }
  
  func setupView() {
    view.addSubview(backgroundImageView)
    view.addSubview(backgroundView)
    
    backgroundView.addSubview(topView)
    topView.addSubview(locationLabel)
    topView.addSubview(statusLabel)
    topView.addSubview(temperatureLabel)
    topView.addSubview(weekdayLabel)
    topView.addSubview(dayLabel)
    topView.addSubview(maxTempLabel)
    topView.addSubview(minTempLabel)
    
    backgroundView.addSubview(temperatureCollectionView)
    
    backgroundView.addSubview(timeTableView)
  }
  
  func setupLayout() {
    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    topView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 0).isActive = true
    topView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0).isActive = true
    topView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0).isActive = true
    topView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.4).isActive = true
    
    locationLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
    locationLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1).isActive = true
    locationLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: UIScreen.main.bounds.maxY / 10).isActive = true
    locationLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    statusLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8).isActive = true
    statusLabel.centerXAnchor.constraint(equalTo: locationLabel.centerXAnchor, constant: 0).isActive = true
    statusLabel.widthAnchor.constraint(equalTo: locationLabel.widthAnchor, multiplier: 1).isActive = true
    statusLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    
    temperatureLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16).isActive = true
    temperatureLabel.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor, constant: 0).isActive = true
    temperatureLabel.widthAnchor.constraint(equalTo: statusLabel.widthAnchor, multiplier: 1).isActive = true
    temperatureLabel.heightAnchor.constraint(equalToConstant: 96).isActive = true
    
    weekdayLabel.topAnchor.constraint(greaterThanOrEqualTo: temperatureLabel.bottomAnchor, constant: 16).isActive = true
    weekdayLabel.leadingAnchor.constraint(greaterThanOrEqualTo: topView.leadingAnchor, constant: 16).isActive = true
    weekdayLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    weekdayLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16).isActive = true
    
    dayLabel.topAnchor.constraint(greaterThanOrEqualTo: temperatureLabel.bottomAnchor, constant: 16).isActive = true
    dayLabel.leadingAnchor.constraint(equalTo: weekdayLabel.trailingAnchor, constant: 8).isActive = true
    dayLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
    dayLabel.bottomAnchor.constraint(equalTo: weekdayLabel.bottomAnchor, constant: 0).isActive = true
    
    minTempLabel.topAnchor.constraint(greaterThanOrEqualTo: temperatureLabel.bottomAnchor, constant: 16).isActive = true
    minTempLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16).isActive = true
    minTempLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16).isActive = true
    minTempLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    maxTempLabel.topAnchor.constraint(greaterThanOrEqualTo: temperatureLabel.bottomAnchor, constant: 16).isActive = true
    maxTempLabel.trailingAnchor.constraint(equalTo: minTempLabel.leadingAnchor, constant: -24).isActive = true
    maxTempLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16).isActive = true
    maxTempLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
    
    temperatureCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
    temperatureCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: -1).isActive = true
    temperatureCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 1).isActive = true
    temperatureCollectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.maxY / 5).isActive = true
    
    timeTableView.topAnchor.constraint(equalTo: temperatureCollectionView.bottomAnchor, constant: 0).isActive = true
    timeTableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0).isActive = true
    timeTableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0).isActive = true
    timeTableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0).isActive = true
  }
  
  func setupCollectionView() {
    temperatureCollectionView.delegate = self
    temperatureCollectionView.dataSource = self
    
    // thay đổi hướng scroll của collectionView
    if let flowLayout = temperatureCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        flowLayout.scrollDirection = .horizontal
    }
  }
  
  func setupTableView() {
    timeTableView.delegate = self
    timeTableView.dataSource = self
  }
  
  func setupData() {
    fakeHourInfo = [
      HourTemp(time: "Bây giờ", imageName: "cloud", temp: "25º"),
      HourTemp(time: "21", imageName: "night", temp: "25º"),
      HourTemp(time: "22", imageName: "cloud", temp: "25º"),
      HourTemp(time: "23", imageName: "cloud", temp: "24º"),
      HourTemp(time: "0", imageName: "moon", temp: "24º"),
      HourTemp(time: "1", imageName: "moon", temp: "23º"),
      HourTemp(time: "2", imageName: "moon", temp: "22º"),
      HourTemp(time: "3", imageName: "moon", temp: "21º"),
      HourTemp(time: "4", imageName: "cloud", temp: "21º"),
      HourTemp(time: "5", imageName: "cloud", temp: "21º"),
      HourTemp(time: "6", imageName: "cloud", temp: "21º"),
      HourTemp(time: "7", imageName: "cloud", temp: "21º"),
      HourTemp(time: "8", imageName: "cloud", temp: "22º"),
      HourTemp(time: "9", imageName: "cloud", temp: "22º"),
      HourTemp(time: "10", imageName: "cloud", temp: "22º"),
      HourTemp(time: "11", imageName: "cloud", temp: "23º"),
    ]
    
    fakeDayInfo = [
      DayTemp(time: "Thứ Bảy", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Chủ Nhật", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Hai", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Ba", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Tư", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Năm", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Sáu", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Bảy", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Chủ Nhật", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Hai", imageName: "cloud", max: "28", min: "13"),
      DayTemp(time: "Thứ Ba", imageName: "cloud", max: "28", min: "13"),
    ]
  }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fakeHourInfo!.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TempCollectionViewCell
//    cell.timeLabel.text = fakeHourInfo![indexPath.row].time
//    cell.statusImageView.image = UIImage(named: fakeHourInfo![indexPath.row].imageName)
//    cell.tempLabel.text = fakeHourInfo![indexPath.row].temp
    cell.info = fakeHourInfo![indexPath.row]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
    return CGSize(width: UIScreen.main.bounds.maxX / 7, height: UIScreen.main.bounds.maxY / 5)
  }
  
  // hàm trả về khoảng cách giữa hai hàng
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 0
  }
  
  // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 0
  }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fakeDayInfo!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = TempTableViewCell()
    cell.timeLabel.text = fakeDayInfo![indexPath.row].time
    cell.statusImageView.image = UIImage(named: fakeDayInfo![indexPath.row].imageName)
    cell.maxTemp.text = fakeDayInfo![indexPath.row].max
    cell.minTemp.text = fakeDayInfo![indexPath.row].min
    return cell
  }
}
