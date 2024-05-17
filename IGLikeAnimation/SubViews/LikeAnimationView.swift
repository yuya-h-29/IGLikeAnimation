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
    var horizontalOffset = 0.0
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
                    .offset(x: value.horizontalOffset, y: value.verticalOffset)
                } keyframes: { _ in
                    // add keyframes in here...
                    
                    KeyframeTrack(\.opacity) {
                        LinearKeyframe(1.0, duration: totalDuration * 0.4, timingCurve: .easeIn)
                    }
                    
                    KeyframeTrack(\.angle) {
                        let angle = Double.random(in: -30..<30)
                        CubicKeyframe(.degrees(angle), duration: totalDuration * 0.2)
                        CubicKeyframe(.degrees(-angle), duration: totalDuration * 0.3)
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
                    
                    KeyframeTrack(\.horizontalOffset) {
                        let offset = Double.random(in: -40..<40)
                        LinearKeyframe(0.0, duration: totalDuration * 0.7)
                        LinearKeyframe(offset, duration: totalDuration * 0.3)
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
