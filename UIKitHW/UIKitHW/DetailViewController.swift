// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Окно на котором воспроизводится трек с помощью UISlider
final class DetailViewController: UIViewController {
    private var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        boardSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    }

    @IBOutlet var trackSlider: UISlider!
    @IBOutlet var boardSlider: UISlider!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBAction func playButton(_ sender: UIButton) {
        playButton.isSelected = !(playButton.isSelected)
        audio()
    }

    // MARK: -

    @IBAction func playedTrack(_ sender: UISlider) {
        if sender == trackSlider {
            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func makeVolumeSlider(_ sender: UISlider) {
        player.volume = boardSlider.value
    }

    @IBAction func clickedCancel(_ sender: Any) {
        player.stop()
        dismiss(animated: true)
    }

    @IBAction func prevButton(_ sender: UIButton) {
        player.stop()
    }

    @IBAction func nextButton(_ sender: UIButton) {}

    var updater: CADisplayLink! = nil
    private func audio() {
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

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
