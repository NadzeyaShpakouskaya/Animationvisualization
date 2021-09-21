//
//  MainViewController.swift
//  Animationvisualization
//
//  Created by Nadzeya Shpakouskaya on 21/09/2021.
//

import Spring

class MainViewController: UIViewController {
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    
    @IBOutlet weak var runAnimationButon: SpringButton!
    
    let animations = DataManager.shared.fetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let animations = animations else { return }
    let animation = animations[0]
        setUpLabelsForAnimationWith(preset: animation.preset,
                   curve: animation.curve,
                   duration: animation.duration,
                   delay: animation.delay,
                   force: animation.force)


    }

    @IBAction func animationButtonPressed(_ sender: SpringButton) {
    }
    
    private func setUpLabelsForAnimationWith(preset: Preset, curve: Curve, duration: Double, delay: Double, force: Double) {
        presetLabel.text = "Preset: \(preset.rawValue)"
        curveLabel.text = "Curve: \(curve.rawValue)"
        durationLabel.text = "Duration: \(String(format:"%.2f", duration))"
        delayLabel.text = "Delay: \(String(format:"%.2f", delay))"
        forceLabel.text = "Force: \(String(format:"%.2f", force))"
    }
}

