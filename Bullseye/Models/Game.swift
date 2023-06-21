//
//  Game.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/18/23.
//

import Foundation

struct Game {
  var target: Int = Int.random(in:  1...100)
  var score = 0
  var round = 1
  
  
  func points(sliderValue:Int) -> Int {
    let bonusForExact: Int = 100
    let bonusForClose: Int = 50
    var pointsToReturn: Int = 0
    
    pointsToReturn = 100 - abs(target - sliderValue)
    if (sliderValue == target) {
      pointsToReturn = pointsToReturn + bonusForExact
    }
    else if (abs(target - sliderValue) <= 2) {
      pointsToReturn = pointsToReturn + bonusForClose
    }
    
    return pointsToReturn
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in:  1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in:  1...100)
  }
  
}
