//
//  WebViewVC.swift
//  ikincieldenal_IOS
//
//  Created by Asad Hamza on 22/10/2024.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKNavigationDelegate {

    enum K {
        static let TERMS_N_CONDITIONS = "https://example.com/terms"
        static let PRIVACY_POLICY = "https://example.com/privacy"
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var lblHeader: UILabel!
    
    private var  termsNConditionUrl = URL(string: K.TERMS_N_CONDITIONS)
    private var  privacyPolicyUrl = URL(string:  K.PRIVACY_POLICY)

    var buttonTapped: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - Helper Functions
    private func setupUI(){
        webView.navigationDelegate = self

        if buttonTapped == 1 {
            lblHeader.text = "Privacy Policy"
            webView.load(URLRequest(url: privacyPolicyUrl!))
        } else if buttonTapped == 2 {
            lblHeader.text = "Terms & Conditions"
            webView.load(URLRequest(url: termsNConditionUrl!))
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.isHidden = true
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.isHidden = true
    }

    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        tabBarController?.tabBar.backgroundColor = UIColor.red
        if let url = webView.url?.absoluteString{
            print("url = \(url)")
            print("asasaas")
        }
    }
    //MARK: - IBActions
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


