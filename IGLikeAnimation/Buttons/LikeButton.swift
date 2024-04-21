//
//  LikeButton.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct LikeButton: View {
    
    var isLiked: Bool
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 26))
                .foregroundStyle(isLiked ? .red : .primary)
        })
    }
}

#Preview {
    LikeButton(isLiked: true, action: { print("LikeButton is tapped") })
}
