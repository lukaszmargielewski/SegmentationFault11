//
//  AppDelegate.swift
//  SegmentationFaultError11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let fault = SegmentationFault11()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        fault.epicFail()
        return true
    }
}

