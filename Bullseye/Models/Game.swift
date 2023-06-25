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
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      addLeaderboardEntry(score: 100, date: Date())
      addLeaderboardEntry(score: 80, date: Date())
      addLeaderboardEntry(score: 200, date: Date())
      addLeaderboardEntry(score: 150, date: Date())
      addLeaderboardEntry(score: 20, date: Date())
    }
  }
  
  
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
    addLeaderboardEntry(score: points, date: Date())

    score += points
    round += 1
    target = Int.random(in:  1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in:  1...100)
  }
  
  struct LeaderboardEntry {
    let score: Int
    let date: Date
  }
  
  mutating func addLeaderboardEntry(score: Int, date: Date) {
    
    let entry = LeaderboardEntry(score: score, date: date)
    leaderboardEntries.append(entry)
    leaderboardEntries.sort { entry1, entry2 in
      entry1.date > entry2.date
    }
  }
}
