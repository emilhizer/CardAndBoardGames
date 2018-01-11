//
//  GameViewController.swift
//  CardAndBoardGamesTV
//
//  Created by Eric Milhizer on 1/10/18.
//  Copyright © 2018 Eric Milhizer. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let fullSKSNameToLoad = checkIfSKSExists(forSceneName: "GameScene")
  
    if let view = self.view as! SKView? {
      // Load the SKScene from 'GameScene.sks'
      if let scene = SKScene(fileNamed: fullSKSNameToLoad) {
          // Set the scale mode to scale to fit the window
          scene.scaleMode = .aspectFill
        
          // Present the scene
          view.presentScene(scene)
      }
    
      view.ignoresSiblingOrder = true
    
      view.showsFPS = true
      view.showsNodeCount = true
    }
  }
  
  func checkIfSKSExists(forSceneName baseSKSName: String) -> String {
    
    var fullSKSNameToLoad = baseSKSName
    
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
      if let _ = GameScene(fileNamed: baseSKSName + "Pad") {
        fullSKSNameToLoad += "Pad"
      }
    case .phone:
      if let _ = GameScene(fileNamed: baseSKSName + "Phone") {
        fullSKSNameToLoad += "Phone"
      }
    case .tv:
      if let _ = GameScene(fileNamed: baseSKSName + "TV") {
        fullSKSNameToLoad += "TV"
      }

    default:
      fatalError("Unsupported userInterfaceIdiom found: \(UIDevice.current.userInterfaceIdiom)")
    }
    
    return fullSKSNameToLoad
  } // checkIfSKSExists

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
}
