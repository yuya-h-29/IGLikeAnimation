//
//  LikeEffectView.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct LikeEffectView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 100))
            .foregroundStyle(.linearGradient(colors: [Color(.igPink), Color(.igRed), Color(.igOrange)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    LikeEffectView()
}
