//
//  UserManager.swift
//  MyVK
//
//  Created by Дамир Зарипов on 08.12.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import Foundation
import CoreData

class UserManager: DataManager {
    
    static var currentUser: UserWithRegistrationCD?
    
    func checkUser(email: String, password: String) -> UserWithRegistrationCD? {
        let context = CoreDataManager.instance.persistentContainer.viewContext
        let request: NSFetchRequest<UserWithRegistrationCD> = UserWithRegistrationCD.fetchRequest()
        let predicate = NSPredicate(format: "(\(#keyPath(UserWithRegistrationCD.email)) = %@) AND (\(#keyPath(UserWithRegistrationCD.password)) = %@)", email, password)
        request.predicate = predicate
        request.fetchLimit = 1
        do {
            let user = try context.fetch(request)
            return user.first
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

}
