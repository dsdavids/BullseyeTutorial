//
//  ContentView.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/18/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 :100)
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .zIndex(1)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionTextView(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.horizontal, 30.0)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      Text("1")
        .foregroundColor(Color("DefaultTextColor"))
        .bold()
        .font(.body)
        .frame(width: 35)
      Slider(value: $sliderValue, in: 1.0...100.0)
        .padding(.horizontal, 10.0)
      Text("100")
        .foregroundColor(Color("DefaultTextColor"))
        .bold()
        .font(.body)
        .frame(width: 35)
    }
    .padding(.horizontal, 10.0)
  }
}

struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button("HIT ME") {
      withAnimation {
        alertIsVisible = true
      }
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonBlue")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    .foregroundColor(.white)
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .bold()
    .font(.title3)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .previewInterfaceOrientation(.landscapeRight)
      .preferredColorScheme(.dark)
  }
}
