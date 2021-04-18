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
    
//    private var person = Person?
    
    private let user = "1"
    private let password = "1"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(person)
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let checkRobotVC = segue.destination as? RobotViewController else { return }
        guard let userInfotVC = segue.destination as? UserInfoViewController else { return }
    }

    
    @IBAction func loginButtonActon(_ sender: Any) {
        
        if inputLoginTF.text != user || inputPasswordTF.text != password {
            performSegue(withIdentifier: "chekRobot", sender: nil)
        } else {
            performSegue(withIdentifier: "answer", sender: nil)
        }
    }

    
}

