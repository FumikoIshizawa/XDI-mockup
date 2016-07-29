//
//  ViewController.swift
//  xdi-mockup
//
//  Created by FumikoIshizawa on 2016/07/28.
//  Copyright © 2016年 fumikoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var inputTableView: UITableView!

  let inputTypes: [String] = [
    "Swipe Up",
    "Swipe Down",
    "Swipe Left",
    "Swipe Right",
    "Tap",
    "Double Tap",
    "Pinch In",
    "Pinch Out",
    "Gyro Up",
    "Gyro Down",
    "Gyro Left",
    "Gyro Right",
    "Accelerometer Left",
    "Accelerometer Right"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}


// MARK: - Setup

extension ViewController {
  private func setupTableView() {
    inputTableView.delegate = self
    inputTableView.dataSource = self
  }
}


// MARK: - UITableView Delegate / Data Source

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
    guard let textLabel = cell.textLabel else { return cell }
    textLabel.text = inputTypes[indexPath.row]
    return cell
  }

  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return inputTypes.count
  }
}