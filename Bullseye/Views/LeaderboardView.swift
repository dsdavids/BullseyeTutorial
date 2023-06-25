//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/23/23.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        TableView(game: $game)
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardIsShowing: Bool

  var body: some View {
    ZStack {
      HStack {
        BigBoldTextView(text: "Leaderboard")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsShowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding([.horizontal, .top])
  }
}

struct TableView: View {
  @Binding var game: Game
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(game.leaderboardEntries.indices, id: \.self) { index in
          let entry = game.leaderboardEntries[index]
          RowView(index: index + 1, score: entry.score, date: entry.date)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelTextView(text: "Score")
        .frame(width: Constants.LeaderboardConstants.scoreColumnWidth)
      Spacer()
      LabelTextView(text: "Date")
        .frame(width: Constants.LeaderboardConstants.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderboardConstants.maxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreTextView(score: score)
        .frame(width: Constants.LeaderboardConstants.scoreColumnWidth)
      Spacer()
      DateTextView(date: Date())
        .frame(width: Constants.LeaderboardConstants.dateColumnWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderboardConstants.maxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static  private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
