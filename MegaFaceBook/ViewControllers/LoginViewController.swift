//
//  LoginViewController.swift
//  MegaFaceBook
//
//  Created by 18316409 on 17.04.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var inputLoginTF: UITextField!
    @IBOutlet weak var inputPasswordTF: UITextField!
    
    // MARK: - Private properties
    private let user = User.getUserData()
    
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
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        inputLoginTF.backgroundColor = .clear
        inputPasswordTF.backgroundColor = .clear
        
    }
      
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfotVC = segue.destination as? UserInfoViewController else { return }
        userInfotVC.user = user
    }

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        inputLoginTF.text = ""
        inputPasswordTF.text = ""
    }
    
    // MARK: IBActions
    @IBAction func loginButtonActon(_ sender: Any) {
        if inputLoginTF.text == "" || inputPasswordTF.text == "" {
            showAlertRegistration(
                title: "Invalid login or password",
                message: "Ошибка заполения логина или пароля, пройдите регистрацию или закройте приложение"
            )
            return
        }
        
        if inputLoginTF.text != user.login || inputPasswordTF.text != user.password {
            performSegue(withIdentifier: "chekRobot", sender: nil)
        } else {
            performSegue(withIdentifier: "answer", sender: user)
        }
    }
    
    @IBAction func helpButtonAction() {
        showAlertHelp(
            title: "Вход супер пользователем",
            message: "Логин: Administrator \n Пароль: Admin"
        )
    }
}


extension LoginViewController: UITextFieldDelegate{
    
    private func showAlertRegistration(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let exitAction = UIAlertAction(title: "Закрыть", style: .default) { _ in
        }
        
        let regAction = UIAlertAction(title: "Регистрация", style: .default) { _ in
            self.performSegue(withIdentifier: "chekRobot", sender: nil)
        }
        
        alert.addAction(regAction)
        alert.addAction(exitAction)
        present(alert, animated: true)
    }

    private func showAlertHelp(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Закрыть", style: .default) { _ in
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
