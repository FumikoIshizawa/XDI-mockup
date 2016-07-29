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

  @IBOutlet weak var applicationOverlapView: UIView!
  @IBOutlet weak var actionOverlapView: UIView!
  
  @IBOutlet weak var webBrowserButton: UIButton!
  @IBOutlet weak var musicPlayerButton: UIButton!
  @IBOutlet weak var arEnvironmentButton: UIButton!
  
  @IBOutlet weak var scrollUpButton: UIButton!
  @IBOutlet weak var scrollDownButton: UIButton!
  @IBOutlet weak var zoomInButton: UIButton!
  @IBOutlet weak var zoomOutButton: UIButton!
  @IBOutlet weak var playSongButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var nextSongButton: UIButton!
  @IBOutlet weak var previousSongButton: UIButton!
  @IBOutlet weak var launchContactButton: UIButton!
  @IBOutlet weak var launchMusicPlayerButton: UIButton!
  @IBOutlet weak var launchWebBrowserButton: UIButton!

  
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
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    applicationOverlapView.hidden = true
    actionOverlapView.hidden = false
  }
}


// MARK: - UIButton Delegate

extension ViewController {
  @IBAction func webBrowserButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
  }
  
  @IBAction func musicPlayerButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
  }
  
  @IBAction func arEnvironmentButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
  }
  
}