//
//  LoginViewController.swift
//  MegaFaceBook
//
//  Created by 18316409 on 17.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var inputLoginTF: UITextField!
    @IBOutlet weak var inputPasswordTF: UITextField!
    
    private let person = Person.getPersonData()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let checkRobotVC = segue.destination as? RobotViewController else { return }
        guard let userInfotVC = segue.destination as? UserInfoViewController else { return }
        userInfotVC.person = person
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        inputLoginTF.text = ""
        inputPasswordTF.text = ""
    }
    
    @IBAction func loginButtonActon(_ sender: Any) {
        if inputLoginTF.text != person.login || inputPasswordTF.text != person.password {
            performSegue(withIdentifier: "chekRobot", sender: nil)
        } else {
            performSegue(withIdentifier: "answer", sender: person)
        }
    }

    
}

