//
//  ThirdViewController.swift
//  currencyExchange_2
//
//  Created by Will Dow on 11/6/14.
//  Copyright (c) 2014 Will Dow. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var currWebView: UIWebView!
    @IBOutlet weak var currSpinner: UIActivityIndicatorView!
    
    func loadWebPage(urlString: String) {
        let url = NSURL.URLWithString(urlString)
        let request = NSURLRequest(URL: url)
        currWebView.loadRequest(request)
        //from music project
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        currWebView.delegate=self
        loadWebPage("http://www.bloomberg.com/markets/currencies/")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func webViewDidStartLoad(webView: UIWebView) {
        currSpinner.startAnimating()
    }
    
    //UIWebViewDelegate method that is called when a web page loads succesfully
    func webViewDidFinishLoad(webView: UIWebView) {
        currSpinner.stopAnimating()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
