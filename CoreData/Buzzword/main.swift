//
//  main.swift
//  ChameleonSession
//
//  Created by Chris Weber on 11.02.16.
//  Copyright © 2016 Thinc. All rights reserved.
//

import UIKit

func isRunningTests() -> Bool {
    let environment = NSProcessInfo.processInfo().environment
    if let injectBundle = environment["XCInjectBundle"] as NSString? {
        return injectBundle.pathExtension == "xctest"
    }
    return false
}

class UnitTestsAppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        self.window?.rootViewController = UIViewController()
        return true
    }
}

if isRunningTests() {
    UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(UnitTestsAppDelegate))
}else{
    UIApplicationMain(Process.argc, Process.unsafeArgv, NSStringFromClass(UIApplication), NSStringFromClass(AppDelegate))
}