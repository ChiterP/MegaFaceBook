//
//  UserInfoViewController.swift
//  MegaFaceBook
//
//  Created by Михаил Мезенцев on 18.04.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    var user: User!
    
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
        
        navigationItem.setHidesBackButton(true, animated: false)
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        greetingLabel.text = "Hello, \(user.person.fullName)! 👻"
        showGreeting(for: user)
        infoLabel.text = user.person.aboutUser
    }
    
    override func viewWillLayoutSubviews() {
        userImage.image = UIImage(named: user.person.image )
    }
    
    private func showGreeting(for person: User) {
        if user.login == "User" {
            messageLabel.text = "Don't brake anything!"
        } else {
            messageLabel.text = "We're sure you'll like our amazing app!"
        }
    }
}
