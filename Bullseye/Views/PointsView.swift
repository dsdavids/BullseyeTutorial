//
//  PointsView.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/23/23.
//

import SwiftUI

struct PointsView: View {
  var points: Int
  var sliderValue: Int
  
    var body: some View {
      VStack(spacing: 10.0, content: {
        InstructionTextView(text: "The Slider's Value is")
        BigNumberText(text: "50")
        BodyTextView(text: "You scored " + String(points) + " points\n🎉🎉🎉")
        ButtonTextView(text: "Start New Round")
      })
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
      PointsView(points: 73, sliderValue: 50)
      PointsView(points: 73, sliderValue: 50)
        .preferredColorScheme(.dark)
        .previewInterfaceOrientation(.landscapeRight)
    }
}
