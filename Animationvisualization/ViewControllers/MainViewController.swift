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
    private var indexOfCurrentAnimation = 0
    private let animations = DataManager.shared.fetchData()
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let animations = animations else { return }
        let animation = animations[indexOfCurrentAnimation]
        setUpLabelsForAnimationWith(animation: animation)
    }
    
    // MARK: - IBActions
    @IBAction func animationButtonPressed(_ sender: SpringButton) {
        guard let animation = animations?[indexOfCurrentAnimation], let count = animations?.count else {return}
        animatingView.animation = animation.preset.rawValue
        animatingView.curve = animation.curve.rawValue
        animatingView.duration = CGFloat(animation.duration)
        animatingView.delay = CGFloat(animation.delay)
        animatingView.force = CGFloat(animation.force)
        animatingView.animate()
        
        setUpLabelsForAnimationWith(animation: animation)
        
        if indexOfCurrentAnimation == count - 1 {
            indexOfCurrentAnimation = 0
        } else {
            indexOfCurrentAnimation += 1
        }

        let title = "Run \(animations?[indexOfCurrentAnimation].preset.rawValue ?? "animation")"
        sender.setTitle(title, for: .normal)
    }

    // MARK: - Private methods
    private func setUpLabelsForAnimationWith(animation: AnimationModel) {
        presetLabel.text = "Preset: \(animation.preset.rawValue)"
        curveLabel.text = "Curve: \(animation.curve.rawValue)"
        durationLabel.text = "Duration: \(String(format:"%.2f", animation.duration))"
        delayLabel.text = "Delay: \(String(format:"%.2f", animation.delay))"
        forceLabel.text = "Force: \(String(format:"%.2f", animation.force))"
    }
}

