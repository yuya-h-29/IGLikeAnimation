//
//  IGListView.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/05/18.
//

import SwiftUI

struct IGListView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                IGPostView(image: .cherryblossom)
                IGPostView(image: .matsuri)
                IGPostView(image: .yoridokoro)
            }
        }
    }
}

#Preview {
    IGListView()
}
