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
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
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
      Slider(value: $sliderValue, in: 1.0...100.0)
        .padding(.horizontal, 10.0)
      Text("100")
        .foregroundColor(Color("DefaultTextColor"))
        .bold()
        .font(.body)
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
      alertIsVisible = true
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonBlue")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .overlay(
      RoundedRectangle(cornerRadius: 21.0)
        .strokeBorder(Color.white, lineWidth: 2.0)
    )
    .foregroundColor(.white)
    .cornerRadius(21.0)
    .bold()
    .font(.title3)
    .alert(
      "Hello There",
      isPresented: $alertIsVisible,
      actions: { Button("Yippee") {
        print("alert closed")
      }
      },
      message: {
        let roundedValue = Int(sliderValue.rounded())
        Text("""
        The slider value is \(roundedValue)
        You scored \(game.points(sliderValue: roundedValue)) in this round
        Your total score is \(self.game.score)
      """)
      }
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
