//
//  GameScene+PropertyList.swift
//  CardAndBoardGames
//
//  Created by Eric Milhizer on 1/11/18.
//  Copyright © 2018 Eric Milhizer. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
  
  
  
  func parsePropertyList(fromPList plist: [String: Any]) {
    
    if let cardsDict = plist["Cards"] as? [String: Any] {
      if let currentDeck = cardsDict[currentDeckPListName] as? [[String: Any]] {
        self.currentDeck = currentDeck
        print(self.currentDeck.count)
      } // get the current card deck
      
    } // "Cards" dictionary
    
    
  } // parsePropertyList
  
  
  
  
  // MARK: - Get Property List from .plist file
  func getPList(fromFile fileName: String) -> [String: Any]? {
    // If fileName doesn't have .plist then add it
    var finalFileName = fileName
    if let fileURL = URL(string: fileName), fileURL.pathExtension == "plist" {
      finalFileName = (fileURL.deletingPathExtension)().absoluteString
    }
    print("Getting PLIST Data from: \(finalFileName)")
    
    guard let fileURL = Bundle.main.url(forResource: finalFileName,
                                        withExtension: "plist") else {
                                          print("Could not find PList file: \(fileName).plist")
                                          return nil
    }
    guard let data = try? Data(contentsOf: fileURL) else {
      print("Could not find PList data in file: \(fileURL)")
      return nil
    }
    
    guard let result = try?
      PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil) as? [String: Any]
      else {
        print("PList data not in correct format: \(data)")
        return nil
    }
    
    return result
  } // getPList
  
  

  
  
  
  
} // GameScene + PropertyList
