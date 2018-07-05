//
//  UserDetailViewController.swift
//  Randomous
//
//  Created by Tianran Ding on 4/07/18.
//  Copyright © 2018 TDing. All rights reserved.
//

import UIKit
import SDWebImage

class UserDetailViewController: UIViewController {
    var selectUser: User?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "💛", style: .done, target: self, action: #selector(heartButtonPressed))
        
        //Setup user basic info
        guard let user = selectUser else { return }
        self.navigationItem.title = "\(user.name.first) \(user.name.last)"
        avatarImageView.sd_setImage(with: URL(string: user.picture.large), placeholderImage: UIImage(named: "avatar"))
        detailTextView.text = "\(user)"
    }
    
    @objc func heartButtonPressed() {
        
    }
}
