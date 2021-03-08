//
//  ViewController.swift
//  SmapleLottie
//
//  Created by Masateru Maegawa on 2021/03/07.
//  Copyright © 2021 Masateru Maegawa. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

final class LottieViewController: UIViewController {

  private var isPlaying: Bool = false

  private let firstAnimationView = AnimationView()
    
    // UIViewにアニメーションを貼り付ける
    @IBOutlet weak var firstContainerView: UIView!{
    didSet {
    // アニメーションファイルの検知
      guard let animation = Animation.named("1733-color-loader", subdirectory: nil) else {
        print("\(#line) file not found")
        return
      }
      firstContainerView.addSubview(firstAnimationView)
      firstAnimationView.snp.makeConstraints { $0.edges.equalToSuperview() }
      firstAnimationView.contentMode = .scaleAspectFit
      firstAnimationView.animation = animation
    }
  }
    
    private let secondAnimationView = AnimationView()
    @IBOutlet weak var secondContainerView: UIView!{
        didSet {
          guard let animation = Animation.named("41990-mail-say-hi", subdirectory: nil) else {
            print("\(#line) file not found")
            return
          }
          secondContainerView.addSubview(secondAnimationView)
          secondAnimationView.snp.makeConstraints { $0.edges.equalToSuperview() }
          secondAnimationView.contentMode = .scaleAspectFit
          secondAnimationView.animation = animation
        }
        
    }
    
    // UIButtonの検知
    @IBOutlet weak var tapAnimationButton: UIButton!{
    didSet {
         tapAnimationButton.addTarget(self, action: #selector(tapAnimation(_:)), for: .touchUpInside)
       }
     }
    }


    // アニメーションの設定
extension LottieViewController {
  @objc func tapAnimation(_ sender: UIButton) {
    // toggleでON/Off切り替え
    isPlaying.toggle()
    let animationViews = [firstAnimationView,secondAnimationView]
    animationViews.forEach {
      // isPlayingがTRUEの時
      if isPlaying {
        print("playing")
        $0.animationSpeed = 1.0
        $0.play(fromProgress: 0, toProgress: 1, loopMode: .loop)
      } else {
        print("stop")
        $0.stop()
      }
    }
  }
}
