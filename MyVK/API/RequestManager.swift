//
//  RequestManager.swift
//  MyVK
//
//  Created by Дамир Зарипов on 20.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

class RequestManager {
    
    static let instance = RequestManager()
    
    var tokenKey = ""
    var user_id = ""
    
    func getUser(compitionBlock: @escaping (UserWithAuthorization) -> ()) {
        
        guard let url = URL(string: "https://api.vk.com/method/users.get?users_id=\(user_id)&fields=id,first_name,last_name,photo_50,bdate,city&access_token=\(tokenKey)&v=5.71") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
        
            if error != nil {
                print("Error")
            } else {
                guard let data = data else { return }
                print(data)
                do {
                    let user = try JSONDecoder().decode(UserWithAuthorization.self, from: data)
                    print(String(describing: user))
                    compitionBlock(user)
                } catch let errorMessage {
                    print(errorMessage.localizedDescription)
                }
            }
        }.resume()
    }
    
    func getNews() {
        
        guard let url = URL(string: "https://api.vk.com/method/wall.get?user_ids=\(user_id)&count=20&filter=owner&access_token=\(tokenKey)&v=5.71") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
    
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
            } else {
                guard let data = data else { return }
                
                do {
                    var modelDictionary = try JSONDecoder().decode([String: UserWithAuthorization].self, from: data)
                    print("Data: \(String(describing: modelDictionary))")
                    if let model = modelDictionary["response"] {
                        print(String(describing: model))
                    }
                    
                } catch let errorMessage {
                    print(errorMessage.localizedDescription)
                }
                
                }
            }.resume()
    }
    
}
