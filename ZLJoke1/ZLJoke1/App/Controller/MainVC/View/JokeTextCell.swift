//
//  JokeTextCell.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/26.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation
import SDWebImage
class JokeTextCell: UITableViewCell {

    
    
    @IBOutlet weak var shareB: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var imgWidthConst: NSLayoutConstraint!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imgV: UIImageView!
    
    internal var imgClick:((jokeCell:JokeTextCell)->Void)?
    internal var imgHeight:CGFloat = 0
    internal var model:JokeModel = JokeModel()
    internal var jokeModel:JokeModel
    {
        get{
            return model
        }
        set{
            model = newValue
            self.updateCell()
        }
    }
    
    func updateCell () -> Void
    {
        contentLabel.text = model.title
        if model.pic != nil {
            weak var imageV = imgV;
            imgV.sd_setHighlightedImageWithURL(NSURL.init(string: model.pic!), options:SDWebImageOptions.ProgressiveDownload, progress: { (x, y) in
                print("%d %d",x,y)
                }, completed: { (img , error, type, url) in
                    imageV?.image = img
            })
        }
        imgHeight = (CGFloat)(model.pic_h)
        imgWidthConst.constant = (CGFloat)(model.pic_w)
        
        
        if (CGFloat)(model.pic_w) > (Globle.screenWidth - 20 ){
            imgHeight = ( Globle.screenWidth - 20)/(imgWidthConst.constant) * imgHeight
            imgWidthConst.constant = Globle.screenWidth - 20
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(imageTap))
        imgV .addGestureRecognizer(tap)
        imgV.userInteractionEnabled = true
        
        buttonView.backgroundColor = UIColor.init(red: 0.88, green: 0.88, blue: 0.88, alpha: 0.7)
    }
    func imageTap() -> Void {
        if imgClick != nil {
            imgClick!(jokeCell: self)
        }
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    func cellHeight() -> CGFloat
    {
        var height:CGFloat = 0
        let style = NSMutableParagraphStyle.init()
        
        style.lineBreakMode = .ByCharWrapping
        var dic = Dictionary<String,AnyObject>()
        dic[NSFontAttributeName] = self.contentLabel.font
        dic[NSParagraphStyleAttributeName] = style
        let text = NSString(CString: self.contentLabel!.text!.cStringUsingEncoding(NSUTF8StringEncoding)!,
                            encoding: NSUTF8StringEncoding)
        let rect = text?.boundingRectWithSize(CGSizeMake(Globle.screenWidth - 25, 1000), options: .UsesLineFragmentOrigin, attributes: dic, context: nil)
        
        if rect != nil {
            height = rect!.height + imgHeight  + 29
        }else
        {
            height = 28
        }
        return height
    }
    
    @IBAction func shareClick(sender: AnyObject)
    {
        
    }

}
