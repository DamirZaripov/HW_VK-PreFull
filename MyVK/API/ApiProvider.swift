//
//  ApiProvider.swift
//  MyVK
//
//  Created by Дамир Зарипов on 20.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

class ApiProvider {
    
    private var baseURL: String!
    
    init(baseURL: String = "https://api.vk.com/method") {
        self.baseURL = baseURL
    }
    
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> ()) {
        guard var url = URL(string: baseURL) else { return }
        url.appendPathComponent(request.endPoint)
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        urlComponents.queryItems = request.parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
        guard let urlWithParameters = urlComponents.url else { return }
        
        let request = URLRequest(url: urlWithParameters)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completionBlock(nil)
                return
            }
            
            completionBlock(data)
        }
        task.resume()
    }
    
}
