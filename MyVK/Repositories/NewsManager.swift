//
//  NewsManager.swift
//  MyVK
//
//  Created by BLVCK on 18/01/2018.
//  Copyright © 2018 itisioslab. All rights reserved.
//

import Foundation
import CoreData

class NewsManager: DataManager {
    
    func getNews() -> [News]? {
        guard let newsSet = UserManager.currentUser?.news else { return nil }
        var news = Array(newsSet)
        news = news.sorted(by: { $0.date < $1.date })
        return news.map { News(from: $0)}
    }
}
