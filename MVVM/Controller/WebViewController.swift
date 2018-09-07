//
//  WebViewController.swift
//  Forma
//
//  Created by mac on 6/27/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var  url_webService = ""
    
    @IBOutlet weak var _webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: url_webService ) {
            let request = URLRequest(url: url)
            _webView.loadRequest(request)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func webViewBackButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
