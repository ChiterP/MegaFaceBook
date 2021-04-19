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
      

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfotVC = segue.destination as? UserInfoViewController else { return }
        userInfotVC.person = person
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        inputLoginTF.text = ""
        inputPasswordTF.text = ""
    }
    
    @IBAction func loginButtonActon(_ sender: Any) {
       
        if inputLoginTF.text == "" || inputPasswordTF.text == "" {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: inputPasswordTF
            )
            return
        }
        
        if inputLoginTF.text != person.login || inputPasswordTF.text != person.password {
            performSegue(withIdentifier: "chekRobot", sender: nil)
        } else {
            performSegue(withIdentifier: "answer", sender: person)
        }
    }
    
    @IBAction func helpButtonAction() {
        
        showAlert(
            title: "Вход супер пользователем",
            message: "Логин: Administrator \n Пароль: Admin",
            textField: inputPasswordTF
        )
    }
}


extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputLoginTF {
            inputPasswordTF.becomeFirstResponder()
        } else {
            loginButtonActon("")
        }
        return true
    }
}
