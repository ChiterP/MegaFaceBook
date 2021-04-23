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
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let userData: String = textField.text else {
            showAlert(with: "Внимание!", and: "Вы не заполнили текущее поле для ввода")
            textField.text = nil
            return
        }
        
        guard userData != "" else {
            showAlert(with: "Внимание!", and: "В текущем поле не может стоять пробел")
            //textField.text = nil
            return
        }
                
        switch textField {
        case nameTextField:
            regUser.person.name = userData
        case lastnameTextField:
            regUser.person.lastName = userData
            emailStackView.isHidden = false
        case emailTextField:
            regUser.email = userData
            loginStackView.isHidden = false
        case loginTextField:
            regUser.login = userData
        case passwordTextField:
            regUser.password = userData
            aboutUserStackView.isHidden = false
        default:
            regUser.person.aboutUser = userData
            registrationButton.isEnabled = true
        }
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true)
    }
}
