//
//  PointsView.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/23/23.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10.0, content: {
      InstructionTextView(text: "The Slider's Value is")
      BigNumberText(text: String(roundedValue))
      BodyTextView(text: "You scored \(points) points\n🎉🎉🎉")
      Button {
        game.startNewRound(points: points)
        withAnimation {
          alertIsVisible = false
        }
      } label: {
        ButtonTextView(text: "Start New Round")
      }
    })
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.landscapeRight)
  }
}
