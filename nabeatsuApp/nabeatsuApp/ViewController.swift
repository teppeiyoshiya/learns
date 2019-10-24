//
//  ViewController.swift
//  nabeatsuApp
//
//  Created by 吉家哲平 on 2019/08/24.
//  Copyright © 2019 吉家哲平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    var count = 0
    var flag3 = false
    var flag5 = false
    
    let picOf3 = UIImage(named: "image3")
    let picOf5 = UIImage(named: "image5")
    let picOf15 = UIImage(named: "image15")
    let picOf1 = UIImage(named: "image1")
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func countUpButton(_ sender: Any) {
        count += 1
        output.text = "count\(count)"
        
        flag3 = false
        flag5 = false
        
        if (count % 3 == 0 || count / 10 == 3 || count % 10 == 3){
            flag3 = true
        }
        if (count % 5 == 0 || count / 10 == 5 || count % 10 == 5){
            flag5 = true
        }
        
        if flag3 && flag5 {
            image.image = picOf15
        } else if flag3 {
            image.image = picOf3
        } else if flag5 {
            image.image = picOf5
        } else {
            image.image = picOf1
        }
        
        if count >= 40 {
            count = 0
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

