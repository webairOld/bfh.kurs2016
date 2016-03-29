//
//  ListBuzzwordsViewController.swift
//  SwiftDiver
//
//  Created by Chris Weber on 01.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

protocol BuzzwordStore {
    func createBuzzword(word:String)
    func allBuzzwords() -> [Buzzword]
    func saveBuzzword(buzzword: Buzzword)
}

class ListBuzzwordsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var buzzwordsTableView: UITableView!
    
    var store: BuzzwordStore = InMemoryBuzzwordStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buzzwordsTableView.dataSource = self
        self.buzzwordsTableView.delegate  = self
    }
    
    override func viewWillAppear(animated: Bool) {
        self.buzzwordsTableView.reloadData()
    }
    
    @IBAction func tappedAddBuzzword(sender: AnyObject) {
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("AddBuzzword")
        self.presentViewController(viewController, animated: true, completion: nil);
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.allBuzzwords().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: nil)
        let buzzword = self.store.allBuzzwords()[indexPath.row]
        cell.textLabel?.text = buzzword.name
        cell.detailTextLabel?.text = "\(buzzword.count)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let buzzword = self.store.allBuzzwords()[indexPath.row]
        let incrementedBuzzword = buzzword.incrementCount()
        self.store.saveBuzzword(incrementedBuzzword)
        self.buzzwordsTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
}
