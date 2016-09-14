//
//  JokeDetailVC.swift
//  ZLJoke1
//
//  Created by 10fenkeMacTwo on 16/8/31.
//  Copyright © 2016年 ZhiLong. All rights reserved.
//

import UIKit

class JokeDetailVC: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    internal var jokeModel:JokeModel?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView .registerNib(UINib.init(nibName: "JokeTextCell", bundle: nil), forCellReuseIdentifier: "CELL")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL") as!JokeTextCell
        if jokeModel != nil {
            cell.jokeModel = jokeModel!
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL") as!JokeTextCell
        if jokeModel != nil {
            cell.jokeModel = jokeModel!
        }
        
        return cell.cellHeight()
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 10
    }
}
