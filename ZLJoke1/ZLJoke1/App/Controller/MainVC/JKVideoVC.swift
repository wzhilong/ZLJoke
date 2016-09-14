//
//  JKVideoVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/9/9.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class JKVideoVC: UIViewController ,AVPlayerViewControllerDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    internal var playerControl:AVPlayerViewController?
    internal var player:AVPlayer?
    internal var jokeModel:JokeModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        
        self.addView()
        playerControl?.player?.play()
    }
    
    func addView() -> Void {
        var height:CGFloat = 0
        
        playerControl = AVPlayerViewController()
        if jokeModel != nil {
            playerControl?.player = AVPlayer.init(URL: NSURL.init(string: (jokeModel?.mp4_url!)!)!)
        }
        playerControl?.videoGravity = AVLayerVideoGravityResizeAspect
        playerControl?.showsPlaybackControls = true
        playerControl?.showsPlaybackControls = true
        if #available(iOS 9.0, *) {
            playerControl?.delegate = self
        } else {
        }
        playerControl?.view.frame = CGRectMake(0, 0, Globle.screenWidth, Globle.screenHeight * 1/2)
        scrollView .addSubview((playerControl?.view)!)
        
        
        height = height + Globle.screenHeight * 1/2 + 15
        let style = NSMutableParagraphStyle.init()
        style.lineBreakMode = .ByCharWrapping
        var dic = Dictionary<String,AnyObject>()
        dic[NSFontAttributeName] = UIFont.systemFontOfSize(15)
        dic[NSParagraphStyleAttributeName] = style
        let rect = jokeModel?.title!.boundingRectWithSize(CGSizeMake(Globle.screenWidth - 30, 1000), options: .UsesLineFragmentOrigin, attributes: dic, context: nil)
        let label = UILabel.init(frame: CGRectMake(15, Screen_H * 1/2 + 15 , Screen_W - 30, rect!.size.height))
        label.font = UIFont.systemFontOfSize(15)
        label.text = jokeModel!.title
        label.numberOfLines = 1000
        
        scrollView .addSubview(label)
        height = height + (rect?.size.height)! + 20
        scrollView.contentSize = CGSizeMake(Globle.screenWidth, height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerViewController(playerViewController: AVPlayerViewController, restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler: (Bool) -> Void) {
        print("xxx")
    }
    deinit{
        if playerControl != nil {
            if #available(iOS 9.0, *) {
                playerControl!.delegate = nil
            } else {
                // Fallback on earlier versions
            }
            playerControl = nil
        }
        
    }
    override func viewWillDisappear(animated: Bool) {
        if playerControl != nil {
            if #available(iOS 9.0, *) {
                playerControl!.delegate = nil
            } else {
                // Fallback on earlier versions
            }
            playerControl?.view .removeFromSuperview()
            playerControl?.player?.pause()
            playerControl = nil
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
