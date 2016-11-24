//
//  DetailViewController.swift
//  SplitView
//
//  Created by na on 2016. 11. 24..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var webView: UIWebView!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let myWebView = webView{
                let url = URL(string: detail )
                let request = URLRequest(url: url!)
                myWebView.scalesPageToFit = true
                myWebView.loadRequest(request)
            }
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

