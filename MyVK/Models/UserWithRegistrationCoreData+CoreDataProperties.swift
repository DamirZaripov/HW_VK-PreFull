//
//  UserWithRegistrationCoreData+CoreDataProperties.swift
//  
//
//  Created by BLVCK on 17/01/2018.
//
//

import Foundation
import CoreData


extension UserWithRegistrationCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserWithRegistrationCoreData> {
        return NSFetchRequest<UserWithRegistrationCoreData>(entityName: "UserWithRegistrationCoreData")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var email: String?
    @NSManaged public var sex: String?
    @NSManaged public var dateBirthday: String?
    @NSManaged public var city: String?
    @NSManaged public var password: String?

}
