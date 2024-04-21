//
//  IGPostView.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct IGPostView: View {
    
    @State private var isLiked = false
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                
                // profile image and name
                ProfileHeader()
                
                Image(.cherryblossom)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                // bottom buttons section
                HStack {
                    
                    LikeButton(isLiked: isLiked) {
                        isLiked.toggle()
                    }
                    
                    /* this time, we just print out some text for the following buttons. */
                    ActionButton(imageName: "message") { print("comment is tapped") }
                    ActionButton(imageName: "paperplane") { print("share is tapped") }
                    Spacer()
                    ActionButton(imageName: "bookmark") { print("save is tapped") }
                    
                }.padding(.horizontal, 16)
            }
            
            // display heart when like button isPressed
            LikeEffectView()
                .opacity(isLiked ? 1.0 : 0.0)
                .scaleEffect(isLiked ? 1.0 : 0.0)
                .rotationEffect(.degrees(isLiked ? 0 : Double.random(in: -60...60)))
                .animation(.spring(dampingFraction: 0.5), value: isLiked)
        }
    }
}

#Preview {
    IGPostView()
}
