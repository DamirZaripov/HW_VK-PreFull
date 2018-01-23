//
//  NewsFromVK.swift
//  MyVK
//
//  Created by Дамир Зарипов on 23.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

struct NewsFromVK: Codable {
    
    struct Response: Codable {
        
        struct Items: Codable {
            let id: Int
            let date: Int
            let text: String
            
            struct Attachments: Codable {
                
                struct Photo: Codable {
                    let photo_130: String
                }
                
                let photo: Photo?
            }
            
            let attachments: [Attachments]?
            
            struct Likes: Codable {
                let count: Int
            }
            
            let likes: Likes
            
            struct Comments: Codable {
                let count: Int
            }
                    
            let comments: Comments
            
            struct Reposts: Codable {
                let count: Int
            }
            
            let reposts: Reposts
        }
        
        let items: [Items]
        
    }
    
    let response: Response
}
