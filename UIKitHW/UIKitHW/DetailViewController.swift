// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Окно на котором воспроизводится трек с помощью UISlider
final class DetailViewController: UIViewController {
    // MARK: - Private Properties

//    private var player = AVAudioPlayer()

    private var currentActivePlayer: AVPlayer?

    private var player: AVPlayer?
//    private var playerTwo: AVPlayer?
    private var updater: CADisplayLink! = nil

    // MARK: - IBOutlet

    @IBOutlet var trackSlider: UISlider!
    @IBOutlet var boardSlider: UISlider!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var playButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 30
        boardSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
    }

    // MARK: - Public Methods

    @IBAction func playedTrack(_ sender: UISlider) {
        if sender == trackSlider {
//            player.currentTime = TimeInterval(sender.value)
        }
    }

    @IBAction func playButton(_ sender: UIButton) {
//        playButton.isSelected = !(playButton.isSelected)
        reproduceAudio()
    }

    @IBAction func clickedCancel(_ sender: Any) {
        player?.pause()
        dismiss(animated: true)
    }

    @IBAction func prevButton(_ sender: UIButton) {
        player?.play()
    }

    @IBAction func nextButton(_ sender: UIButton) {
        player?.pause()
    }

    // MARK: - PrivateMethods

    private func reproduceAudio() {
        if let audioPath = Bundle.main.url(forResource: "secondTrack", withExtension: "mp3") {
            let playerItem = AVPlayerItem(url: audioPath)
            player = AVPlayer(playerItem: playerItem)

            currentActivePlayer = player

            player?.addPeriodicTimeObserver(
                forInterval: CMTime(seconds: 1, preferredTimescale: 1),
                queue: DispatchQueue.main
            ) { [weak self] time in
                if let duration = self?.player?.currentItem?.duration.seconds {
                    self?.trackSlider?.value = Float(time.seconds / duration)
                }
            }
        }
    }

    private func switchesTracks() {
        if currentActivePlayer == player {
            currentActivePlayer = player
            player?.pause()
            player?.play()
        } else {
            currentActivePlayer = player
            player?.pause()
            player?.play()
        }
    }
}
