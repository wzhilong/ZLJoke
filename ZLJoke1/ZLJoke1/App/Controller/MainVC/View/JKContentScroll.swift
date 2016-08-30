//
//  JKContentScroll.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/29.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JKContentScroll: UIScrollView ,UIScrollViewDelegate
{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
     internal  var endDecelerating:((Int)->Void)?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.pagingEnabled = true
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bounces = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal var width:CGFloat
    {
        get{
            return self.frame.size.width
        }
    }
    internal var height:CGFloat{
        get{
            return self.frame.size.height
        }
    }
    
    
    internal var tableArray:[JokeTableView] = Array()
    func addJokeTableSubleView(table:JokeTableView) -> Void
    {
        table.frame = CGRectMake(width * (CGFloat)(tableArray.count), 0, width, self.frame.size.height)
        self .addSubview(table)
        tableArray .append(table)
        self.contentSize = CGSizeMake(width * (CGFloat)(tableArray.count), height)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let x = (Int)(scrollView.contentOffset.x)/(Int)(scrollView.frame.size.width)
        NSLog("%d", x)
        if (endDecelerating != nil)
        {
            endDecelerating!(x)
        }
    }
    func scrollToIndex(index:Int) -> Void {
        self .scrollRectToVisible(CGRectMake(width * (CGFloat)(index), 0, width, height), animated: true)
    }
    
}
