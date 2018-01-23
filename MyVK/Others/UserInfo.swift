//
//  User.swift
//  MyVK
//
//  Created by itisioslab on 22.09.17.
//  Copyright © 2017 itisioslab. All rights reserved.
//

import UIKit
import Foundation

class UserInfo {
    
    private static let avatars = [#imageLiteral(resourceName: "test-avatar-1"), #imageLiteral(resourceName: "test-avatar-2"), #imageLiteral(resourceName: "test-avatar-3")]
    private static let statuses = [#imageLiteral(resourceName: "icon-online"), #imageLiteral(resourceName: "icon-phone"), #imageLiteral(resourceName: "icon-offline")]
    private static let maxRandomValue: UInt32 = 100
  
    static func createInfo(with userWithAuthorization: UserWithAuthorization) -> User {
        let idUser = userWithAuthorization.response.first?.id
        let avatar = getImage(from: (userWithAuthorization.response.first?.photo_50)!)
        let name = userWithAuthorization.response.first?.first_name
        let surname = userWithAuthorization.response.first?.last_name
        let city = userWithAuthorization.response.first?.city.title
        let age = getFullYears(from: (userWithAuthorization.response.first?.bdate)!)
        let status = statuses[Int(arc4random_uniform(UInt32(statuses.count)))]
        let presents = Int(arc4random_uniform(maxRandomValue))
        return User(idUser: idUser!, avatar: avatar, name: name!, surname: surname!, age: age, city: city!, status: status,
                    followers: [User](), presents: presents)
    }
    
    static func getFullYears(from dateBithrdayString: String) -> Int {
        
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "dd-MM-yyyy"
        let bdate = dateForrmater.date(from: dateBithrdayString)
        
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: bdate!, to: now)
       
        return ageComponents.year!
    }
    
    static func getImage(from url: String) -> UIImage {
        
        let imageURL = URL(string: url)
        let data = try? Data(contentsOf: imageURL!)
        return UIImage(data: data!)!
    }
    
}
