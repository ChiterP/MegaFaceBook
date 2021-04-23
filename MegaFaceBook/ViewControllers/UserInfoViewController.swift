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
    
    @IBOutlet weak var userImage: UIImageView!
    
    var person: User!
    var user: User!       // передача зарегестрированного экземпляра Юзера для отображения
    
    private let primaryColor = UIColor(
        red: 210 / 255,
        green: 109 / 255,
        blue: 128 / 255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 107 / 255,
        green: 148 / 255,
        blue: 230 / 255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        greetingLabel.text = "Hello, \(user.person.fullName)! 👻"
        //showGreeting(for: person)
    }
    
    override func viewWillLayoutSubviews() {
        userImage.image = UIImage(named: user.person.image )
    }
    
    private func showGreeting(for person: Person) {
        if user.person.name == "Admin" {
            userInfoLabel.text = "Don't brake anything!"
        } else {
            userInfoLabel.text = "We're sure you'll like our amazing app!"
        }
    }
}
