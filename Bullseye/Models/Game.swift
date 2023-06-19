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
    return 100 - abs(target - sliderValue)
  }
  
}
