//
//  LoginWithVKViewController.swift
//  MyVK
//
//  Created by Дамир Зарипов on 20.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import UIKit

class LoginWithVKViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    let urlVK = "https://oauth.vk.com/authorize?client_id=6342844&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.52"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.delegate = self
        guard let url = URL(string: urlVK) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.webView.loadRequest(request)
                }
            } else {
                print("ERROR: \(String(describing: error))")
            }
        }
        task.resume()
    }
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        let currentURL = webView.request?.url?.absoluteString
        
        let textRange = (currentURL?.lowercased() as NSString?)?.range(of: "access_token".lowercased())
        
        if textRange?.location != NSNotFound {
    
            let data = currentURL?.components(separatedBy: CharacterSet(charactersIn: "=&"))
            guard let token = data?[1] else { return }
            guard let user_id = data?[5] else { return }
            
            RequestManager.instance.tokenKey = token
            RequestManager.instance.user_id = user_id
            
            RequestManager.instance.getUser(compitionBlock: { (user) in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let pageNVC = storyboard.instantiateViewController(withIdentifier: "mainNVC") as! UINavigationController
                
                guard let pageVC = pageNVC.viewControllers.first as? NewViewController else { return }
                pageVC.userWithAuthorization = user
                self.present(pageNVC, animated: true, completion: nil)
            })
        }
    }
    
}

