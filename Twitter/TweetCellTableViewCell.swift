
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Foshanji on 9/28/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    //@IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    
    var favorited:Bool = false
    var tweetId:Int = -1
    //var retweeted:Bool = false
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavoriteTweet(true)
            }, failure: { (error) in
                print("Favorite did not succed: \(error)")
                
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavoriteTweet(true)
            }, failure: { (error) in
                print("UnFavorite did not succed: \(error)")
           })
        }
    }
    
        @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
    })
    
}
    func setRetweeted(_ isRetweeted: Bool) {
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green@3x.png"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else {
            
            retweetButton.setImage(UIImage(named: "retweet-icon.png"), for: UIControl.State.normal)
             retweetButton.isEnabled = true
            
        
        }
       
    }
        
        func setFavoriteTweet(_ isFavorited:Bool) {
            favorited = isFavorited
            if (favorited) {
                favButton.setImage(UIImage(named: "favor-icon-red.png"), for: UIControl.State.normal)
            }
            else {
                favButton.setImage(UIImage(named: "favor-icon.png"), for: UIControl.State.normal)
                
            }
        
        
func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        }
    }
}
