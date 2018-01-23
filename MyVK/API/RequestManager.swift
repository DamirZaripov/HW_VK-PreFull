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
    let apiVersion = "5.71"
    let baseURL = "https://api.vk.com/method"
    
    let methodUsersGet = "users.get"
    let methodWallGet = "wall.get"
    
    func getUser(compitionBlock: @escaping (UserWithAuthorization) -> ()) {
        
       // guard let url = URL(string: "\(baseURL)/\(methodUsersGet))?users_id=\(user_id)&fields=id,first_name,last_name,photo_50,bdate,city&access_token=\(tokenKey)&v=\(apiVersion)") else { return }
        
        guard let url = URL(string: "https://api.vk.com/method/users.get?users_id=\(user_id)&fields=id,first_name,last_name,photo_50,bdate,city&access_token=\(tokenKey)&v=5.71") else { return }
        
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
        
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
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
    
    
    func getNews(complitionBlock: @escaping (NewsFromVK) -> ()) {
        
        
        //guard let url = URL(string: "\(baseURL)/\(methodWallGet)?owner_id=\(user_id)&count=10&filter=owner&access_token=\(tokenKey)&v=\(apiVersion)") else { return }
        
        guard let url = URL(string: "https://api.vk.com/method/wall.get?user_ids=\(user_id)&count=20&filter=owner&access_token=\(tokenKey)&v=5.71") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
            } else {
                guard let data = data else { return }
                do {
                    let newsDictionary = try JSONDecoder().decode(NewsFromVK.self, from: data)
                    
                    print("Data \(String(describing: newsDictionary))")
                    
                    complitionBlock(newsDictionary)
                } catch let errorMessage {
                    print(errorMessage.localizedDescription)
                }
            }
        }.resume()
    }
    
    func postNews(message: String, complitionBlock: @escaping (Bool) ->()) {
        
        guard let url = URL(string: "https://api.vk.com/method/wall.post?user_ids=\(user_id)&messagge=\(message)&access_token=\(tokenKey)&v=\(apiVersion)") else { return }
        
        let parameters = [""]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
            } else {
                complitionBlock(true)
            }
        }.resume()
    }
}
