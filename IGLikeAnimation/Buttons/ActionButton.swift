//
//  ActionButton.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct ActionButton: View {
    
    var imageName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: imageName)
                .font(.system(size: 26))
                .foregroundStyle(.foreground)
        })
    }
}

#Preview {
    ActionButton(imageName: "paperplane", action: { print("ActionButton is tapped")})
}
