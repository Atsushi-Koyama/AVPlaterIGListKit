//
//  AVPlayerView.swift
//  SampleIGListKit
//
//  Created by Atsushik on 2018/08/16.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import AVKit

class AVPlayerView: UIImageView {
    override public class var layerClass: AnyClass {
        get {
            return AVPlayerLayer.self
        }
    }
    
    private var playerLayer: AVPlayerLayer? {
        return self.layer as? AVPlayerLayer
    }
    
    func player() -> AVPlayer? {
        return playerLayer?.player
    }
    
    func setPlayer(player: AVPlayer) {
        playerLayer?.player = player
    }
    
}

