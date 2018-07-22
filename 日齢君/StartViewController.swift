//
//  StartViewController.swift
//  日齢君
//
//  Created by 杉山航 on 2016/07/18.
//  Copyright © 2016年 杉山航. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var sun: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("viewDidAppear")
            
        let animation = CABasicAnimation(keyPath: "transform")
            
        animation.fromValue = NSNumber(value: 0 as Double)
            
        animation.toValue = NSNumber(value: 2 * M_PI as Double)
            
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
            
        animation.duration = 5
        
        animation.repeatCount = Float.infinity
            
        sun.layer.add(animation, forKey: nil)
    }


}
