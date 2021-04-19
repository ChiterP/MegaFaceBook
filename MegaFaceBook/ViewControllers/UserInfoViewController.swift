//
//  UserInfoViewController.swift
//  MegaFaceBook
//
//  Created by Михаил Мезенцев on 18.04.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingLabel.text = "Hello, \(person.user.name) \(person.user.surname)! 👻"
    }
}
