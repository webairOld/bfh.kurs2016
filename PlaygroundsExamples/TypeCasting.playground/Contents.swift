//: Playground - noun: a place where people can play

import UIKit

class MySpecificViewController : UIViewController {
    var string: String = ""
}

func viewController() -> UIViewController {
    return MySpecificViewController()
}

let vc = viewController() as! MySpecificViewController

if viewController() is MySpecificViewController {
    let vc = viewController() as! MySpecificViewController
}