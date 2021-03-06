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

  @IBOutlet weak var appButtonContainerView: UIView!
  @IBOutlet weak var actionButtonContainerView: UIView!

  @IBOutlet weak var webBrowserButton: UIButton!
  @IBOutlet weak var musicPlayerButton: UIButton!
  @IBOutlet weak var arEnvironmentButton: UIButton!

  @IBOutlet weak var webBrowserActionsView: UIView!
  @IBOutlet weak var musicPlayerActionsView: UIView!
  @IBOutlet weak var arEnvironmentActionsView: UIView!
  
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


// MARK: - View

extension ViewController {
  private func deselectAppButtons() {
    for view in appButtonContainerView.subviews {
      guard let button = view as? UIButton else { continue }
      button.backgroundColor = UIColor.whiteColor()
      button.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
  }

  private func deselectActionButtons() {
    for view in actionButtonContainerView.subviews {
      guard let button = view as? UIButton else { return }
      button.backgroundColor = UIColor.whiteColor()
      button.setTitleColor(UIColor.blackColor(), forState: .Normal)
      button.selected = false
    }
  }

  private func showWebAppActionButtonView() {
    webBrowserActionsView.hidden = false
    musicPlayerActionsView.hidden = true
    arEnvironmentActionsView.hidden = true
  }

  private func showMusicAppActionButtonView() {
    webBrowserActionsView.hidden = true
    musicPlayerActionsView.hidden = false
    arEnvironmentActionsView.hidden = true
  }

  private func showArAppActionButtonView() {
    webBrowserActionsView.hidden = true
    musicPlayerActionsView.hidden = true
    arEnvironmentActionsView.hidden = false
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
    webBrowserButton.backgroundColor = UIColor.whiteColor()
    webBrowserButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    musicPlayerButton.backgroundColor = UIColor.whiteColor()
    musicPlayerButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    arEnvironmentButton.backgroundColor = UIColor.whiteColor()
    arEnvironmentButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    deselectAppButtons()
    deselectActionButtons()
  }
}


// MARK: - UIButton Delegate

extension ViewController {
  @IBAction func webBrowserButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
    deselectAppButtons()
    showWebAppActionButtonView()
    webBrowserButton.backgroundColor = UIColor.darkGrayColor()
    webBrowserButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)

  }
  
  @IBAction func musicPlayerButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
    deselectAppButtons()
    showMusicAppActionButtonView()
    musicPlayerButton.backgroundColor = UIColor.darkGrayColor()
    musicPlayerButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
  }
  
  @IBAction func arEnvironmentButtonTapped(sender: UIButton) {
    actionOverlapView.hidden = true
    deselectAppButtons()
    showArAppActionButtonView()
    arEnvironmentButton.backgroundColor = UIColor.darkGrayColor()
    arEnvironmentButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
  }

  @IBAction func scrollUpButtonTapped(actionButton: UIButton) {
    if actionButton.selected {
      actionButton.backgroundColor = UIColor.whiteColor()
      actionButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
      actionButton.selected = false
    } else {
      actionButton.backgroundColor = UIColor.darkGrayColor()
      actionButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
      actionButton.selected = true
    }
  }
}
