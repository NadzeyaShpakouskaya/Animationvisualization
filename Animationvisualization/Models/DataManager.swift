//
//  DataManager.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 23/09/2021.
//

import Spring

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func provideSpringCurves() -> [String] {
        let springCurves = Spring.AnimationCurve.allCases.map { $0.rawValue }
        return springCurves
    }
    
    func provideSpringPresets() -> [String] {
        let springPresets = Spring.AnimationPreset.allCases.map { $0.rawValue }
        return springPresets
    }
}
