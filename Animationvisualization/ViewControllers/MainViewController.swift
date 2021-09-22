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
    private var currentAnimation = Animation.randomAnimation()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitlesForLabelsWith(currentAnimation)
    }
    
    // MARK: - IBActions
    @IBAction func animationButtonPressed(_ sender: SpringButton) {
        setUpTitlesForLabelsWith(currentAnimation)
        animate(animatingView, with: currentAnimation)
        
        currentAnimation = Animation.randomAnimation()
        
        setTitleFor(springButton: sender, as: currentAnimation.preset)
    }
    
    // MARK: - Private methods
    private func setUpTitlesForLabelsWith(_ animation: Animation) {
        presetLabel.text = "Preset: \(animation.preset)"
        curveLabel.text = "Curve: \(animation.curve)"
        durationLabel.text = "Duration: \(String(format:"%.2f", animation.duration))"
        delayLabel.text = "Delay: \(String(format:"%.2f", animation.delay))"
        forceLabel.text = "Force: \(String(format:"%.2f", animation.force))"
    }
    
    private func animate(_ springView: SpringView, with animation: Animation) {
        springView.animation = animation.preset
        springView.curve = animation.curve
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

