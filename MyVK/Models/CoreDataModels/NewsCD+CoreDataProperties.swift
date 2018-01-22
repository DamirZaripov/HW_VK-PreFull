//
//  NewsCD+CoreDataProperties.swift
//  
//
//  Created by Дамир Зарипов on 18.01.18.
//
//

import Foundation
import CoreData


extension NewsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewsCD> {
        return NSFetchRequest<NewsCD>(entityName: "NewsCD")
    }

    @NSManaged public var date: Date
    @NSManaged public var image: Data?
    @NSManaged public var numberOfComments: Int16
    @NSManaged public var numberOfLikes: Int16
    @NSManaged public var numberOfReposts: Int16
    @NSManaged public var text: String?
    @NSManaged public var user: UserWithRegistrationCD?

}
