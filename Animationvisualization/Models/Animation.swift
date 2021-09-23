//
//  AnimationModel.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 21/09/2021.
//

struct Animation {
    let preset: String
    let curve: String
    let duration: Double
    let delay: Double
    let force: Double
    
    var description: String {
        """
        Preset: \(preset)
        Curve: \(curve)
        Duration: \(String(format:"%.2f", duration))
        Delay: \(String(format:"%.2f", delay))
        Force: \(String(format:"%.2f", force))
        """
    }
    
    static func randomAnimation() -> Animation {
        let dataManager = DataManager.shared
        let animation = Animation(
            preset: dataManager.provideSpringPresets().randomElement() ?? "slideLeft",
            curve: dataManager.provideSpringCurves().randomElement() ?? "easeIn",
            duration: Double.random(in: 0.5...2),
            delay: Double.random(in: 0.35...1),
            force: Double.random(in: 0.5...1.5)
        )
        
        return animation
    }
}

