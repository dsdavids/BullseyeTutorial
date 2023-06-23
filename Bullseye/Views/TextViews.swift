//
//  TextViews.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/18/23.
//

import SwiftUI

struct InstructionTextView: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color("DefaultTextColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .foregroundColor(Color("DefaultTextColor"))
      .bold()
      .font(.largeTitle)
      .fontWeight(.black)
  }
}

struct LabelTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("DefaultTextColor"))
  }
}

struct BodyTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .padding()
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundColor(Color("DefaultTextColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct ButtonTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .font(.body)
      .bold()
      .foregroundColor(Color(.white))
      .cornerRadius(12.0)
  }
}

struct RoundedTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
        .font(.title)
        .foregroundColor(Color("DefaultTextColor"))
        .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
        .overlay(
            Circle()
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
  }
}

struct ScoreTextView: View {
  var score: Int
  
  var body: some View {
    Text(String(score))
      .font(.title2)
      .bold()
      .foregroundColor(Color("DefaultTextColor"))
      .kerning(-0.2)
  }
}

struct RoundsTextView: View {
  var rounds: Int
  
  var body: some View {
    Text(String(rounds))
      .font(.title2)
      .bold()
      .foregroundColor(Color("DefaultTextColor"))
      .kerning(-0.2)
  }
}

struct DateTextView: View {
  var date: Date
  
  var body: some View {
    Text(date, style: .time)
      .font(.title2)
      .bold()
      .foregroundColor(Color("DefaultTextColor"))
  }
}



struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    
    VStack(spacing: 10) {
      InstructionTextView(text: "Instructions")
      BigNumberText(text: "BigNum")
      LabelTextView(text: "Label Text")
      BodyTextView(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonTextView(text: "Start New Round")
      RoundedTextView(text: "4")
      ScoreTextView(score: 149)
      DateTextView(date: Date())
    }
    .padding()
  }
}
