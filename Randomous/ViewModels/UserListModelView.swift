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
    var userData = [User]()
    var page = 1
    var busy = false
    
    func fetchData() {
        //Only fetch new data when there's no concurrent tast
        guard busy == false else { return }
        
        busy = true
        GetAllUsers(pageSize: Const.UserPageSize, pageIndex: page).execute(onSuccess: { (data: RandomResult) in
            self.userData.append(contentsOf: data.results)
            NotificationCenter.default.post(name: .UserDataFetched, object: nil)
            self.page += 1
            self.busy = false
        }, onError: { (error: Error) in
            NotificationCenter.default.post(name: .UserDataFetched, object: nil)
            print(error)
            self.busy = false
        })
    }
    
}
