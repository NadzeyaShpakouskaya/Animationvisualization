//
//  MainViewController.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 21/09/2021.
//

import Spring

class MainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var animatingView: SpringView!
    
    // MARK: - Private properties
    private var currentAnimation = AnimationModel.randomAnimation()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabelsForAnimationWith(animation: currentAnimation)
    }
    
    // MARK: - IBActions
    @IBAction func animationButtonPressed(_ sender: SpringButton) {
        setUpLabelsForAnimationWith(animation: currentAnimation)
        animate(springView: animatingView, with: currentAnimation)
        
        currentAnimation = AnimationModel.randomAnimation()
        
        setTitleFor(springButton: sender, as: currentAnimation.preset.rawValue)
    }
    
    // MARK: - Private methods
    private func setUpLabelsForAnimationWith(animation: AnimationModel) {
        presetLabel.text = "Preset: \(animation.preset.rawValue)"
        curveLabel.text = "Curve: \(animation.curve.rawValue)"
        durationLabel.text = "Duration: \(String(format:"%.2f", animation.duration))"
        delayLabel.text = "Delay: \(String(format:"%.2f", animation.delay))"
        forceLabel.text = "Force: \(String(format:"%.2f", animation.force))"
    }
    
    private func animate(springView: SpringView, with animation: AnimationModel) {
        springView.animation = animation.preset.rawValue
        springView.curve = animation.curve.rawValue
        springView.duration = CGFloat(animation.duration)
        springView.delay = CGFloat(animation.delay)
        springView.force = CGFloat(animation.force)
        springView.animate()
    }
    
    private func setTitleFor(springButton: SpringButton, as value: String ) {
        let title = "Run \(value)"
        springButton.setTitle(title, for: .normal)
    }
}

