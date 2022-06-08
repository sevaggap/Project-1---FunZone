//
//  SearchViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit
import WebKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webKitView = WKWebView()
        let url = URL(string: "https://www.google.com/")!
        webKitView.load(URLRequest(url: url))
        view = webKitView
    }

}
