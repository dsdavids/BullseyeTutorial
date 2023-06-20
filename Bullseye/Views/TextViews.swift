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

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
      
      VStack(spacing: 10) {
          InstructionTextView(text: "Instructions")
          BigNumberText(text: "BigNum")
          LabelTextView(text: "Label Text")
      }
  }
}
