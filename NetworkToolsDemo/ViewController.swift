//
//  ViewController.swift
//  NetworkToolsDemo
//
//  Created by leergou on 16/7/21.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        STNetworkTools.sharedTools.loadWeatherData({ (responseObject) in
            
            print("\(responseObject)")
        }) { (error) in
            
            print("\(error)")
        }
    }
}

