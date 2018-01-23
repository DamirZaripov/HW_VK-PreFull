//
//  Likes.swift
//  MyVK
//
//  Created by Дамир Зарипов on 23.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

struct Likes: Codable {
    
    struct Response: Codable {
        let likes: Int
    }
    
    let response: Response
}
