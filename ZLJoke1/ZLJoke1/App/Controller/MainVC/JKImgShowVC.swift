//
//  JKImgShowVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/9/8.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import SDWebImage
class JKImgShowVC: UIViewController ,UIScrollViewDelegate{

    internal var width:CGFloat = UIScreen.mainScreen().bounds.size.width
    internal var dataArray:Array<AnyObject> = Array<AnyObject>()
    internal var selectedModel:JokeModel?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var infoL: UILabel!
    @IBOutlet weak var adView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self .configView()
    }
    func configView () -> Void
    {
        scrollView.pagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bouncesZoom = false
        scrollView.bounces = false
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.delegate = self
        
        infoL.backgroundColor = UIColor.blackColor()
        infoL.alpha = 0.8;
        
        var x :CGFloat = 0
        for obj in dataArray
        {
            if let model = obj as? JokeModel
            {
                if  selectedModel == model  {
                    scrollView.contentOffset = CGPointMake(Globle.screenWidth * x, 0)
                }
                
                let imgV = UIImageView.init(frame: CGRectMake(Globle.screenWidth * x, 0, Globle.screenWidth, Globle.screenHeight))
                
                imgV .sd_setImageWithURL(NSURL.init(string: model.pic!))
                imgV.contentMode = .ScaleToFill
                scrollView .addSubview(imgV)
                x = x + 1
                scrollView.contentSize = CGSizeMake(Globle.screenWidth * x , Globle.screenHeight)
                
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapBack))
                imgV .addGestureRecognizer(tap)
                imgV.userInteractionEnabled = true
                
                
            }
        }
    }
    func tapBack() -> Void {
        self .dismissViewControllerAnimated(true) {
            
        }
    }
    
    @IBAction func backBClick(sender: AnyObject) {
        tapBack()
    }
    /**
     scroll的代理 当设置pagingEnable时 翻到页面触发
     
     - parameter scrollView: <#scrollView description#>
     */
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        let x:Int = (Int)(scrollView.contentOffset.x / scrollView.frame.size.width)
        if  x < dataArray.count {
            if let jokeModel = dataArray[x] as? JokeModel
            {
                print("%@",jokeModel)
                infoL.text = jokeModel.title
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
