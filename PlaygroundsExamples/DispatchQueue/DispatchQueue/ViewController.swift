//
//  ViewController.swift
//  DispatchQueue
//
//  Created by Chris Weber on 24.05.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.myLabel.text = "My Label"
        self.activityIndicator.startAnimating()
        
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)) {
            sleep(3)
            dispatch_async(dispatch_get_main_queue()) {
                self.topConstraint.constant = 10;
            }
            
        }
    }


}

