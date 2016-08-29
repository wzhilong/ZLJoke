//
//  JKScrollTitle.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/25.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JKScrollTitle: UIScrollView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    let tagIndex:Int = 10
    
    internal var titleArray:[String]?
    internal var selectTitleFunc :((num:Int,title:String)->Void)?
    internal var preSelectButton:UIButton?
    
    
    
    let height :CGFloat = 49
    let width :CGFloat = 60
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bounces = false
        self.bouncesZoom = false
    }
    

    
    func addTitleArray(titleA:[String] ,selectFunc:(num:Int ,title:String)->Void) -> Void
    {
        self.selectTitleFunc = selectFunc
        self.titleArray = titleA
        
        self .addTitleButton()
        self.contentSize = CGSizeMake(width * (CGFloat)(titleA.count), height)
        
        let but = (self.viewWithTag(tagIndex))
        if (but != nil) {
            self.titleButtonClick(but as! UIButton);
        }
    }
    
    func addTitleButton()->Void
    {
        var index = 0
        for title in self.titleArray!
        {
            let but = UIButton.init(frame: CGRectMake((width + 0 )*(CGFloat)(index),0 ,width , height))
            but .addTarget(self, action: #selector(titleButtonClick(_:)), forControlEvents: .TouchUpInside)
            but.tag = index + tagIndex
            but.setTitle(title, forState:.Normal)
            but.titleLabel?.font = UIFont.systemFontOfSize(15)
            self .addSubview(but)
            
            index = index + 1
        }
    }
    
    func titleButtonClick(sender:UIButton) -> Void
    {
        //点击执行的界面变化
        self.titleSelectedAnimate(sender)
        
        //执行点击的回调函数
        if self.selectTitleFunc != nil
        {
            self.selectTitleFunc!(num: sender.tag - tagIndex,title: (sender.titleLabel?.text)!);
        }
    }
    func  titleClickAtIndex(index:Int) -> Void
    {
        let  view = self.viewWithTag(index+tagIndex)
        let but = view as! UIButton
        self .titleButtonClick(but)
    }
    
    /**
     点击标题后的界面变换 被点击的转移到中间
     */
    func titleSelectedAnimate(sender:UIButton)->Void
    {
        NSLog("%f", Globle.screenWidth/2)
        let width = self.contentOffset.x + Globle.screenWidth/2 - sender.center.x

        var x = (self.contentOffset.x - width)
        if x <= 0 {
            x = 0
        }
        if x + self.frame.width > self.contentSize.width {
            x = self.contentSize.width - self.frame.width
        }

        UIView .animateWithDuration(0.3) {
            self.contentOffset = CGPointMake(x, self.contentOffset.y)
            if self.preSelectButton == nil {
                self.preSelectButton = sender
            }
            else
            {
                self.preSelectButton!.titleLabel?.font = UIFont.systemFontOfSize(15)
            }
            sender.titleLabel?.font = UIFont.systemFontOfSize(18)
            self.preSelectButton = sender
        }
        
    }

}
