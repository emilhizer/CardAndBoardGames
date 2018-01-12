//
//  GameScene.swift
//  CardAndBoardGamesTV
//
//  Created by Eric Milhizer on 1/10/18.
//  Copyright © 2018 Eric Milhizer. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
  var boardData = [String: Any]()
  
  var currentDeckPListName = "52PlayingCardDeck"
  var currentDeck = [[String: Any]]()
  
  // MARK: - Did Move To View
  override func didMove(to view: SKView) {
    
    if let boardData = getPList(fromFile: "BoardData") {
      self.boardData = boardData
    } else {
      fatalError("Could Not Load Game Data 'BoardData.plist'")
    }
    
    parsePropertyList(fromPList: boardData)
    
  } // didMove:to view
  
  
  
  
  
  
} // GameScene







