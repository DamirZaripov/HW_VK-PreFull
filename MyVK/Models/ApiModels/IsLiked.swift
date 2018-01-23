//
//  IsLiked.swift
//  MyVK
//
//  Created by Дамир Зарипов on 23.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

struct IsLiked: Codable {
    
    struct Response: Codable {
        let liked: Int
    }
    
    let response: Response
}
