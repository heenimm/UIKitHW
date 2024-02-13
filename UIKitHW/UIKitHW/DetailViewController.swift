// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Окно на котором воспроизводится трек с помощью UISlider
final class DetailViewController: UIViewController {
    // MARK: - Private Properties

    private var player = AVAudioPlayer()
    private var updater: CADisplayLink! = nil

    // MARK: - IBOutlet

    @IBOutlet var trackSlider: UISlider!
    @IBOutlet var boardSlider: UISlider!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBAction func playButton(_ sender: UIButton) {
        playButton.isSelected = !(playButton.isSelected)
        reproduceAudio()
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        boardSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    }

    // MARK: - Public Methods

    @IBAction func playedTrack(_ sender: UISlider) {
        if sender == trackSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func clickedCancel(_ sender: Any) {
        player.stop()
        dismiss(animated: true)
    }

    @IBAction func prevButton(_ sender: UIButton) {
        player.currentTime -= 15
    }

    @IBAction func nextButton(_ sender: UIButton) {
        player.currentTime += 15
    }

    // MARK: - PrivateMethods

    private func reproduceAudio() {
        playButton.isSelected = !(playButton.isSelected)
        do {
            if playButton.isSelected {
                if let audioPath = Bundle.main.path(forResource: "secondTrack", ofType: "mp3") {
                    try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                    trackSlider.maximumValue = Float(player.duration)
                    timeLabel.text = String(player.currentTime)
                    player.play()
                }
            } else {
                player.stop()
            }
        } catch {
            print("Error")
        }
    }
}
