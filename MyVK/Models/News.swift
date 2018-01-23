//
//  News.swift
//  MyVK
//
//  Created by itisioslab on 11.10.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit
import CoreData

class News {

    let id: Int
    let date: Int
    let text: String
    let image: String?
    let numberOfLikes: Int
    let numberOfComments: Int
    let numberOfReposts: Int
    
    init(id: Int, date: Int, text: String, image: String?, numberOfLikes: Int, numberOfComments: Int, numberOfReposts: Int) {
        self.id = id
        self.date = date
        self.text = text
        self.image = image
        self.numberOfLikes = numberOfLikes
        self.numberOfComments = numberOfComments
        self.numberOfReposts = numberOfReposts
    }
    
//    convenience init(from newsCD: NewsCD) {
//        var image: UIImage?
//        if let imageDataFromCD = newsCD.image {
//            image = UIImage(data: imageDataFromCD)
//        }
//
//        self.init(date: newsCD.date, text: newsCD.text, image: image , numberOfLikes: Int(newsCD.numberOfLikes), numberOfComments: Int(newsCD.numberOfComments), numberOfReposts: Int(newsCD.numberOfReposts))
//    }
//
//    func convertToNewsCD(in context: NSManagedObjectContext) -> NSManagedObject {
//        let news = NewsCD(context: context)
//        news.date = date
//        news.numberOfComments = Int16(numberOfComments)
//        news.numberOfLikes = Int16(numberOfLikes)
//        news.numberOfReposts = Int16(numberOfReposts)
//        news.text = text
//
//        var imageData: Data?
//        if let image = image {
//            if let convertedImageToData = UIImageJPEGRepresentation(image, 1.0) {
//                imageData = convertedImageToData
//            }
//        }
//        news.image = imageData
//        return news
//    }
    
}
