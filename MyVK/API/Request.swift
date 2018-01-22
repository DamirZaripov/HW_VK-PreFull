//
//  Request.swift
//  MyVK
//
//  Created by Дамир Зарипов on 20.01.18.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation

protocol Request {
    var method: Methods { get }
    var endPoint: String { get }
    var parameters: [String: Any] { get }
}

enum Methods: String {
    case get = "GET"
    case post = "POST"
}
