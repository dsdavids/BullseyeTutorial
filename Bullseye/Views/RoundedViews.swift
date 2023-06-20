//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Dean S. Davids on 6/20/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("DefaultTextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokedColor"), lineWidth: 2)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("DefaultTextColor"))
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                    .stroke(lineWidth: 2)
                    .foregroundColor(Color("ButtonStrokedColor"))
            )
    }
    
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundRectTextView(text: "Text")
        }
    }
    
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
