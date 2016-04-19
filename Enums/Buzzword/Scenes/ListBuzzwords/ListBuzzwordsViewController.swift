//
//  ListBuzzwordsViewController.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class ListBuzzwordsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var buzzwordsTableView: UITableView!
    
    var store: BuzzwordStore = InMemoryBuzzwordStore()
    var buzzwords = [Buzzword]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buzzwordsTableView.dataSource = self
        self.buzzwordsTableView.delegate  = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.loadBuzzwords()
    }
    
    func loadBuzzwords() {
        self.buzzwords = self.store.allBuzzwords()
        self.buzzwordsTableView.reloadData()
    }
    
    @IBAction func tappedAddBuzzword(sender: AnyObject) {
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("AddBuzzword") as! AddBuzzwordViewController
        viewController.store = self.store
        self.presentViewController(viewController, animated: true, completion: nil)
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.buzzwords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        let buzzword = self.buzzwords[indexPath.row]
        cell.textLabel?.text = buzzword.name
        cell.detailTextLabel?.text = "\(buzzword.count)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let buzzword = self.buzzwords[indexPath.row]
        let incrementedBuzzword = buzzword.incrementCount()
        self.store.saveBuzzword(incrementedBuzzword)
        self.loadBuzzwords()
    }
}
