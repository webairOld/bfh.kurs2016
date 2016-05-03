//
//  ViewController.swift
//  TableExample
//
//  Created by Chris Weber on 03.05.16.
//  Copyright © 2016 BLS. All rights reserved.
//

import UIKit

struct Contact {
    let name:String
    let firstname: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    
    var contacts: [String: [Contact]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        
        contacts = [String:[Contact]]()
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.timer), userInfo: nil, repeats: false)
    }
    
    func timer() {
        contacts = ["Simpsons":  [Contact(name: "Maulwurf", firstname: "Hans"),
            Contact(name: "Simpsons", firstname: "Homer"),
            Contact(name: "Barny", firstname: "Gumble")],
         "Others":[
            Contact(name: "Peter", firstname: "Bursch"),
            Contact(name: "Benny", firstname: "Hirt"),
            Contact(name: "Prince", firstname: "The Real"),
            Contact(name: "Gibson", firstname: "Mel"),
            ]]
        
        self.tableView.beginUpdates()
        
        self.tableView.insertSections(NSIndexSet(indexesInRange: NSRange(location: 0,length: 2)), withRowAnimation: .Middle)
        self.tableView.insertRowsAtIndexPaths(
            [NSIndexPath(forRow: 0, inSection: 1),
            NSIndexPath(forRow: 1, inSection: 1),
            NSIndexPath(forRow: 2, inSection: 1),
            NSIndexPath(forRow: 0, inSection: 0),
            NSIndexPath(forRow: 1, inSection: 0),
            NSIndexPath(forRow: 2, inSection: 0),
            NSIndexPath(forRow: 3, inSection: 0),
            ], withRowAnimation: .Middle)
        
        self.tableView.endUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return contacts.keys.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = Array(contacts.keys)[section]
        return key
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(contacts.keys)[section]
        let listOfContacts = contacts[key]
    
        return listOfContacts!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let key = Array(contacts.keys)[indexPath.section]
        let listOfContacts = contacts[key]
        let contact = listOfContacts![indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Subtitle")! as! SmileyTableViewCell
        cell.nameLabel.text = contact.name;
        cell.firstNameLabel.text = contact.firstname;
        return cell
    }
    
    

}

