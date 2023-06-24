//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/20/23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      ringsView()
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button {
        // Show Leaderboard
        leaderboardIsShowing = true
      } label: {
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing) {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing)
      }
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5) {
      LabelTextView(text: title)
      RoundRectTextView(text: text)
    }
  }
}

struct ringsView: View {
  @Environment(\.colorScheme ) var colorScheme
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(
              gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
