//
//  SuggestVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeTableView: UITableView{

    internal var tableDelegate:JKTableDelegate = JKTableDelegate()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.dataSource = tableDelegate
        self.delegate = tableDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
