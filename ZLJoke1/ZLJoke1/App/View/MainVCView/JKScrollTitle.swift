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
    internal var titleArray:[String]?
    internal var selectTitleFunc :((num:Int,title:String)->Void)?
    internal var preSelectButton:UIButton!
    
    let height :CGFloat = 49
    let width :CGFloat = 60
    
    
    
    func addTitleArray(titleA:[String] ,selectFunc:(num:Int ,title:String)->Void) -> Void
    {
        self.selectTitleFunc = selectFunc
        self.titleArray = titleA
        
        self .addTitleButton()
        self.contentSize = CGSizeMake(width * (CGFloat)(titleA.count), height)
        
    }
    
    func addTitleButton()->Void
    {
        var index = 0
        for title in self.titleArray!
        {
            let but = UIButton.init(frame: CGRectMake((width + 0 )*(CGFloat)(index),20 ,width , height))
            but .addTarget(self, action: #selector(titleButtonClick(_:)), forControlEvents: .TouchUpInside)
            but.tag = index
            but.setTitle(title, forState:.Normal)
            but.backgroundColor = UIColor.redColor()
            but.titleLabel?.font = UIFont.systemFontOfSize(15)
            self .addSubview(but)
            
            index = index+1
        }
        
    }
    
    func titleButtonClick(sender:UIButton) -> Void {
        if self.selectTitleFunc != nil
        {
//            self.preSelectButton.titleLabel?.font = UIFont.systemFontOfSize(15);
            sender.titleLabel?.font = UIFont.systemFontOfSize(18)
            self.selectTitleFunc!(num:sender.tag ,title:self.titleArray![sender.tag])
            
            self.preSelectButton = sender
            
        }
        
    }

}
