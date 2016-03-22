//
//  AddBuzzwordViewController.swift
//  Buzzowrd
//
//  Created by Chris Weber on 22.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class AddBuzzwordViewController: UIViewController {
    
    var store: BuzzwordStore!
    @IBOutlet var textfield: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textfield.text = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func tappedSave(sender: AnyObject) {
        self.store.createBuzzword(textfield.text)
        self.tappedCancel(sender)
    }
    
}
