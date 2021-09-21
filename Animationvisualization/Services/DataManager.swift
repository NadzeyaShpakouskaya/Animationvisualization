//
//  DataManager.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 21/09/2021.
//
import Foundation

class DataManager {
    // MARK: - Singleton
    static let shared = DataManager()
    
    // MARK: - Initializer
    private init() {}
    
    // MARK: - Public methods
    func fetchData() -> [AnimationModel] {
        AnimationModel.generateAnimations(counts: 25)
    }
}
