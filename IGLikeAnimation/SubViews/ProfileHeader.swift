//
//  ProfileHeader.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .font(.system(size: 40))
            
            Text("yuya")
        }.padding(.horizontal, 4)
    }
}

#Preview {
    ProfileHeader()
}
