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
        
        ZStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                
                // profile image and name
                ProfileHeader()
                
                Image(.cherryblossom)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                // bottom buttons section
                HStack {
                    
                    Button {
                        didTapLike()
                    } label: {
                        LikeButton(isLiked: isLiked)
                    }
                    
                    /* this time, we just print out some text for the following buttons. */
                    ActionButton(imageName: "message") { print("comment is tapped") }
                    ActionButton(imageName: "paperplane") { print("share is tapped") }
                    Spacer()
                    ActionButton(imageName: "bookmark") { print("save is tapped") }
                    
                }.padding(.horizontal, 16)
            }
            
            // display heart when like button isPressed
            LikeAnimationView(shouldAnimate: isLiked)
        }
    }
    
    private func didTapLike() {
        isLiked.toggle()
    }
}

#Preview {
    IGPostView()
}
