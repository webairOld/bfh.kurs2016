//
//  ShowProfileViewController.swift
//  Layout
//
//  Created by Chris Weber on 26.02.16.
//  Copyright © 2016 BFH. All rights reserved.
//

import UIKit

class ShowProfileViewController: UIViewController {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var about: UITextView!
    
    var profile:ProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.image = profile.image
        self.name.text = profile.name
        self.phone.text = profile.phoneNumber
        self.email.text = profile.email
        self.about.text = profile.about
    }
}
