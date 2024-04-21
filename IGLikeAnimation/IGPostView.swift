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
    }
}

#Preview {
    IGPostView()
}
