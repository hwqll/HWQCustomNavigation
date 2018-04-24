//
//  FirstViewController.swift
//  HWQCustomNavigation
//
//  Created by hwq on 2018/4/20.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if let id = identifier {
            if id == "child" {
                let des = segue.destination as! FirstChildViewController
                des.hidesBottomBarWhenPushed = true
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
        let presentLoginRegister = UserDefaults.standard.bool(forKey: "presentLoginRegister")
        if  !presentLoginRegister {
            self.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "点击"
        return cell
    }

}

