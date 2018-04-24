//
//  LoginViewController.swift
//  HWQCustomNavigation
//
//  Created by hwq on 2018/4/20.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let left = UIBarButtonItem(image: UIImage(named: "关闭"), style: .plain, target: self, action: #selector(closeBtnTapped))
        self.navigationItem.leftBarButtonItem = left
    }
    
    @objc func closeBtnTapped() {
        let tabbar = UIApplication.shared.keyWindow?.rootViewController as! HWQTabbarController
        tabbar.selectedIndex = 0
        UserDefaults.standard.setValue(false, forKey: "presentLoginRegister")
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

}
