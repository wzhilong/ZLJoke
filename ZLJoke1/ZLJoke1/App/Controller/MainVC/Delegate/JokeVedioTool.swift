//
//  JokeVedioTool.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/31.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import AVFoundation
class JokeVedioTool :NSObject
{
    
    weak internal var onView:UIView?
    internal var player:AVPlayer?
    internal var layer:AVPlayerLayer?
    internal var item:AVPlayerItem?
    func addNotification()->Void{
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(vedioToEnd(_:)), name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
    }
    func removeNotification() -> Void {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    //AVPlayerItemDidPlayToEndTimeNotification
    func vedioToEnd (noti:NSNotification) -> Void {
        
    }
    //AVPlayerItemPlaybackStalledNotification
    func vedioJumped(noti:NSNotification) -> Void {
        
    }
    //AVPlayerItemTimeJumpedNotification
    func movieStalle (noti:NSNotification) -> Void {
        
    }

    func addAVPlayerObserver()->Void
    {
        let item = player?.currentItem
        if item != nil {
            self .addObserver(item!, forKeyPath: "status", options: NSKeyValueObservingOptions.New, context: nil)
            
            self.addObserver(item!, forKeyPath: "loadedTimeRanges" , options:NSKeyValueObservingOptions.New, context: nil)
        }
        
    }
    func removeAVPlayerItemObserver() -> Void {
        let item = player?.currentItem
        if item != nil {
            self .removeObserver(item!, forKeyPath: "status")
            self.removeObserver(item!, forKeyPath: "loadedTimeRanges")
        }
    }
    
    func playerVedio(urlStr:String ,onView:UIView)
    {
        self.onView = onView
        
        let url = NSURL.init(string: urlStr)
        item = AVPlayerItem.init(URL: url!)
        player = AVPlayer.init(playerItem: item!)
        self.addAVPlayerObserver()
        
        layer = AVPlayerLayer.init(player: player)
        layer?.frame = onView.frame
        
        
        
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        let playerItem = object as!AVPlayerItem
        if keyPath == "status" {
            switch playerItem.status {
            case .Failed:
                
                break
            case .ReadyToPlay:
                break
            case .Unknown:
                break
            default:
                break
            }
        }
        //缓冲进度
        if keyPath == "loadedTimeRanges" {
        }
        
    }
    
    
}
