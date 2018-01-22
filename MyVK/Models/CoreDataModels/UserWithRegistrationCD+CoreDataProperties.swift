//
//  UserWithRegistrationCD+CoreDataProperties.swift
//  
//
//  Created by BLVCK on 18/01/2018.
//
//

import Foundation
import CoreData


extension UserWithRegistrationCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserWithRegistrationCD> {
        return NSFetchRequest<UserWithRegistrationCD>(entityName: "UserWithRegistrationCD")
    }

    @NSManaged public var city: String
    @NSManaged public var dateBirthday: String
    @NSManaged public var email: String
    @NSManaged public var name: String
    @NSManaged public var password: String
    @NSManaged public var sex: String
    @NSManaged public var surname: String
    @NSManaged public var news: Set<NewsCD>

}

// MARK: Generated accessors for news
extension UserWithRegistrationCD {

    @objc(addNewsObject:)
    @NSManaged public func addToNews(_ value: NewsCD)

    @objc(removeNewsObject:)
    @NSManaged public func removeFromNews(_ value: NewsCD)

    @objc(addNews:)
    @NSManaged public func addToNews(_ values: Set<NewsCD>)

    @objc(removeNews:)
    @NSManaged public func removeFromNews(_ values: Set<NewsCD>)

}
