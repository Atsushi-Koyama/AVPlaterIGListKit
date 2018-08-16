//
//  PostTableViewCell.swift
//  SampleIGListKit
//
//  Created by test on 2018/08/16.
//  Copyright © 2018年 Atsushi. All rights reserved.
//

import UIKit
import AVKit

class PostTableViewCell: UICollectionViewCell {
    
    
    var player:AVPlayer!
    var playerView: AVPlayerView!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setAVPostData(_ postData: PostData) {
        
        if let urlString = postData.movieURL {
            guard let url = URL(string: urlString) else {
                return
            }
            
            playerView = AVPlayerView(frame: self.image.frame)
            self.image.addSubview(playerView)
            
            self.player = AVPlayer(url: url)
            
            self.playerView.setPlayer(player: self.player)
            
            self.player.play()
        }
        
        if postData.isLiked == true {
            let buttonImage = UIImage(named: "star_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        }else{
            let buttonImage = UIImage(named: "star_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}

