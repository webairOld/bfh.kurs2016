//
//  AddBuzzwordViewController.swift
//  Buzzowrd
//
//  Created by Chris Weber on 22.03.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class AddBuzzwordViewController: UIViewController {
    
    let webservice = BuzzwordAPI(connector: APIConnector())
    let store: BuzzwordStore = BuzzwordCoreDataStore()

    @IBOutlet var textField: BorderedTextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tappedCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayAlertWithMessage(message:String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        self.presentViewController(alert, animated: false, completion: nil)
    }
    
    @IBAction func tappedSave(sender: AnyObject) {
        webservice.createBuzzword(self.textField.text) { result in
            switch (result) {
            case .Success(let buzzword):
                self.store.saveBuzzword(buzzword)
                self.tappedCancel(sender)
            case .Failure(let errorMessage):
                self.displayAlertWithMessage(errorMessage)
            case .NetworkError:
                self.displayAlertWithMessage("Network Error, please try again")
            }
        }
    }
    
}
