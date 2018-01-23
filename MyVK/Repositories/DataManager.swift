//
//  DataManager.swift
//  MyVK
//
//  Created by Дамир Зарипов on 03.12.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager: ManagerProtocol {
    
    let classUserWithRegistration = "UserWithRegistration"
    let classNews = "News"
    
    init() {}

    func syncSave<T: AnyObject>(with obj: T) -> Bool {

        var isSaved = false
    
        if (NSStringFromClass(T.self).components(separatedBy: ".")[1] == classUserWithRegistration) {
            let user = obj as? UserWithRegistration
            let contex = CoreDataManager.instance.persistentContainer.viewContext
            let model = UserWithRegistrationCD(context: contex)
            
            if let newUser = user {
                model.name = newUser.name
                model.surname = newUser.surname
                model.email = newUser.email
                model.sex = newUser.sex
                model.dateBirthday = newUser.dateBirthday
                model.city = newUser.city
                model.password = newUser.password
            }

            do {
                try contex.save()
                isSaved = true
            } catch {
                print(error.localizedDescription)
            }
        }
        
//        if (NSStringFromClass(T.self).components(separatedBy: ".")[1] == classNews) {
//            let news = obj as? News
//            let contex = CoreDataManager.instance.persistentContainer.viewContext
//            let newsCD = news?.convertToNewsCD(in: contex)
//            UserManager.currentUser?.addToNews(newsCD as! NewsCD)
//            CoreDataManager.instance.saveContext()
//            isSaved = true
//        }
        
        return isSaved
    }
    
    func asynSave<T: AnyObject>(with obj: T, complitionBlock: @escaping (Bool) -> ()) {
        let operationQueue = OperationQueue()
        operationQueue.addOperation { [weak self] in
            guard let strongSelf = self else { return }
            let isSaved = strongSelf.syncSave(with: obj)
            complitionBlock(isSaved)
        }
    }
    
}
