//
//  UserWithAuthorization.swift
//  MyVK
//
//  Created by Дамир Зарипов on 22.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

struct UserWithAuthorization: Codable {
    
    struct Response: Codable {
        let id: Int
        let first_name: String
        let last_name: String
        let photo_50: String
        let bdate: String
        
        struct City: Codable {
            let id: Int
            let title: String
        }
        
        let city: City
    }
    
    let response: [Response]
}
