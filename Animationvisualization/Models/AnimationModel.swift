//
//  AnimationModel.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 21/09/2021.
//

struct AnimationModel {
    let preset: Preset
    let curve: Curve
    let duration: Double
    let delay: Double
    let force: Double
    
    static func randomAnimation() -> AnimationModel {
        let preset = Preset.allCases.randomElement()
        let curve = Curve.allCases.randomElement()
        let duration = Double.random(in: 0.5...2)
        let delay = Double.random(in: 0.35...1)
        let force = Double.random(in: 0.5...1.5)
        
        let animation = AnimationModel(
            preset: preset ?? .fadeIn,
            curve: curve ?? .easeInOut,
            duration: duration,
            delay: delay,
            force: force
        )
        
        return animation
    }
}

enum Preset: String, CaseIterable {
    case slideLeft
    case slideRight
    case slideDown
    case slideUp
    case squeezeLeft
    case squeezeRight
    case squeezeDown
    case squeezeUp
    case fadeIn
    case fadeOut
    case fadeOutIn
    case fadeInLeft
    case fadeInRight
    case fadeInDown
    case fadeInUp
    case zoomIn
    case zoomOut
    case fall
    case shake
    case pop
    case flipX
    case flipY
    case morph
    case squeeze
    case flash
    case wobble
    case swing
}

enum Curve: String, CaseIterable {
    case easeIn
    case easeOut
    case easeInOut
    case linear
    case spring
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeInBack
    case easeOutBack
    case easeInOutBack
}
