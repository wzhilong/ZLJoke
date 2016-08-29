//
//  JokeTextCell.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeTextCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func cellHeight() -> CGFloat
    {
        var height:CGFloat = 0
        let style = NSMutableParagraphStyle.init()
        
        style.lineBreakMode = .ByCharWrapping
        let dic:NSDictionary = NSDictionary.init(objects: ["NSFontAttributeName","NSParagraphStyleAttributeName"], forKeys: [self.contentLabel.font,style])
        let text = NSString(CString: self.contentLabel!.text!.cStringUsingEncoding(NSUTF8StringEncoding)!,
                            encoding: NSUTF8StringEncoding)
        let rect = text?.boundingRectWithSize(CGSizeMake(self.frame.size.width - 20, 1000), options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil)
        
        if rect != nil {
            height = rect!.height + 40
        }else
        {
            height = 40
        }
        
        return height
        
    }
    
}
