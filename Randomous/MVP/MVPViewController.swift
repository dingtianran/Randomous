//
//  MVPViewController.swift
//  Randomous
//
//  Created by Tianran Ding on 4/07/18.
//  Copyright © 2018 TDing. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet var userTableView: UITableView!
    
    var users = UserList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(interfaceUpdated), name: .UserDataFetched, object: nil)
        users.fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func interfaceUpdated() {
        userTableView.reloadData()
    }
    
    func invokeDetailSceneFor(user: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        detailVC.selectUser = user
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableCell") as! UserTableCell
        cell.updateUserInfo(user: users.userData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        invokeDetailSceneFor(user: users.userData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //User scroll to the bottom, should load more......
        if indexPath.row == users.userData.count-1 {
            users.fetchData()
        }
    }
}

class UserTableCell: UITableViewCell {
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userGenderLabel: UILabel!
    @IBOutlet var userBDayLabel: UILabel!
    
    func updateUserInfo(user: User) {
        userAvatar.sd_setImage(with: URL(string: user.picture.thumbnail), placeholderImage: UIImage(named: "avatar"))
        userName.text = "\(user.name.first) \(user.name.last)"
        switch user.gender {
        case "male":
            userGenderLabel.text = "👦🏼"
        case "female":
            userGenderLabel.text = "👩🏼"
        default:
            userGenderLabel.text = "🌈"
        }
        userBDayLabel.text = "\(user.dob.date)"
    }
}
