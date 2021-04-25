//
//  RegistrationViewController.swift
//  MegaFaceBook
//
//  Created by Nikita Kelevra on 19.04.2021.
//




import UIKit

class RegistrationViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var aboutUserStackView: UIStackView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var aboutUserTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    
    // MARK: - Private properties
    //private let person = Person.getPersonData()
    var regUser = User(login: "", password: "", email: "", person: Person(name: "", lastName: "", aboutUser: "", image: ""))
    
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
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setupUI()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let UserInfoVC = segue.destination as? UserInfoViewController else { return }
        UserInfoVC.user = regUser
    }
    
    // MARK: - IBActions
    @IBAction func RegistationButton(_ sender: Any) {
        view.endEditing(true)
        performSegue(withIdentifier: "ShowUserInfoVC", sender: nil)
    }
}

    // MARK: - Private Methods
extension RegistrationViewController: UITextFieldDelegate {
    private func setupUI() {
        for stackView in [emailStackView, loginStackView, aboutUserStackView] {
            stackView?.isHidden.toggle()        //прячем все  Стеки, кроме итого что с именем юзера
        }
    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case lastnameTextField: emailStackView.isHidden = false
        case emailTextField: loginStackView.isHidden = false
        case passwordTextField: aboutUserStackView.isHidden = false
        default: registrationButton.isEnabled = true
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let userData = textField.text, !userData.isEmpty else {
            showAlert(with: "Внимание!", and: "Вы не заполнили текущее поле для ввода")
            textField.text = nil
            return
        }
        
        guard userData != " " else {
            showAlert(with: "Внимание!", and: "В текущем поле не может стоять пробел")
            textField.text = nil
            return
        }
                
        switch textField {
        case nameTextField:
            regUser.person.name = userData
        case lastnameTextField:
            regUser.person.lastName = userData
        case emailTextField:
            guard validateEmail(enteredEmail: userData) else {
                showAlert(with: "Внимание!", and: "Данные в текущем поле не корректны")
                textField.text = nil
                loginStackView.isHidden = true
                return
            }
            regUser.email = userData
        case loginTextField:
            regUser.login = userData
        case passwordTextField:
            regUser.password = userData
        default:
            regUser.person.aboutUser = userData
        }
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Принято!", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    // Проверка правильно введенного Е-мейла
    func validateEmail(enteredEmail: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
}
