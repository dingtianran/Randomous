//
//  UserListModelView.swift
//  Randomous
//
//  Created by Tianran Ding on 5/07/18.
//  Copyright © 2018 TDing. All rights reserved.
//

import UIKit
import Foundation

extension Notification.Name {
    static let UserDataFetched = Notification.Name("UserDataFetched")
}

class UserList {
    var userData: [User]?
    
    func fetchData() {
        GetAllUsers().execute(onSuccess: { (data: RandomResult) in
            print(data.results)
            self.userData = data.results
            NotificationCenter.default.post(name: .UserDataFetched, object: nil)
        }, onError: { (error: Error) in
            print(error)
        })
    }
    
}
