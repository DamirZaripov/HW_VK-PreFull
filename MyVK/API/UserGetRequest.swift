//
//  UserGetRequest.swift
//  MyVK
//
//  Created by Дамир Зарипов on 20.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

class UserGetRequest: Request {
    var method: Methods = .get
    var endPoint: String = "users.get"
    var parameters: [String : Any]
    
    private let fieldsKey = "fields"
    private let accessTokenKey = "access_token"
    
    init(fields: [String], token: String) {
        self.parameters = [fieldsKey: fields.joined(separator: ","), accessTokenKey: token]
    }
    
}
