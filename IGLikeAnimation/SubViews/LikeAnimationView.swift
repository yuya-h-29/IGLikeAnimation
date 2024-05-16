//
//  LikeEffectView.swift
//  IGLikeAnimation
//
//  Created by Yuya Harada on 2024/04/21.
//

import SwiftUI

struct AnimationValues {
    var opacity = 0.0
    var scale = 0.0
    var angle = Angle.zero
    var verticalOffset = 0.0
}

struct LikeAnimationView: View {
    
    var shouldAnimate: Bool
    
    @State private var animationCount = 0
    private let totalDuration = 1.0
    
    var body: some View {
        LikeView()
            .onChange(of: shouldAnimate, {
                guard shouldAnimate else { return }
                animationCount += 1
            })
            .keyframeAnimator(
                initialValue: AnimationValues(),
                trigger: animationCount
            ) { content, value in
                content
                    .opacity(value.opacity)
                    .scaleEffect(value.scale)
                    .rotationEffect(value.angle)
                    .offset(y: value.verticalOffset)
                } keyframes: { _ in
                    // add keyframes in here...
                    
                    KeyframeTrack(\.opacity) {
                        LinearKeyframe(1.0, duration: totalDuration * 0.4, timingCurve: .easeIn)
                    }
                    
                    KeyframeTrack(\.angle) {
                        CubicKeyframe(.degrees(15), duration: totalDuration * 0.2)
                        CubicKeyframe(.degrees(-15), duration: totalDuration * 0.3)
                        LinearKeyframe(.degrees(.zero), duration: totalDuration * 0.2)
                    }
                    
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(1.2, duration: totalDuration * 0.5)
                        LinearKeyframe(1.0, duration: totalDuration * 0.2, timingCurve: .easeOut)
                    }
                    
                    KeyframeTrack(\.verticalOffset) {
                        LinearKeyframe(0.0, duration: totalDuration * 0.7)
                        LinearKeyframe(-700, duration: totalDuration * 0.3, timingCurve: .easeIn)
                    }
                }
    }
}

struct LikeView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 80))
            .foregroundStyle(
                .linearGradient(
                    colors: [Color(.igPink), Color(.igRed), Color(.igOrange)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
    }
}

#Preview {
    LikeAnimationView(shouldAnimate: true)
}
