//
//  UINavigationController+Ext.swift
//  HWQCustomNavigation
//
//  Created by hwq on 2018/4/20.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return topViewController
    }
}

