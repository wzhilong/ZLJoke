//
//  JKContentScroll.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/29.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JKContentScroll: UIScrollView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    internal var tableArray:[JokeTableView] = Array()
    func addJokeTableSubleView(table:JokeTableView) -> Void
    {
        table.frame = CGRectMake(self.frame.size.width * (CGFloat)(tableArray.count), 0, self.frame.size.width, self.contentSize.height)
        self .addSubview(table)
        self.contentSize = CGSizeMake(self.frame.size.width * (CGFloat)(tableArray.count), self.contentSize.height)
    }
    
}
