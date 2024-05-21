//
//  IGPostView.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct IGPostView: View {
    
    @State private var isLiked = false
    @State private var likeAnimationViews: [LikeAnimationView] = []
    private let animationDuration = 1.0
    
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
            
            ForEach(likeAnimationViews) { likeAnimationView in
                likeAnimationView.onAppear {
                    // when the animation ends, remove a LikeAnimationView from the array
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        likeAnimationViews.removeFirst()
                    }
                }
            }
        }
    }
    
    private func didTapLike() {
        isLiked.toggle()
        guard isLiked else { return }
        
        likeAnimationViews.append(LikeAnimationView(duration: animationDuration))
    }
}

#Preview {
    IGPostView()
}
