//
//  DetailViewController.swift
//  NewsReaderApp
//
//  Created by 吉家哲平 on 2019/08/28.
//  Copyright © 2019 吉家哲平. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var link: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
