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
    
    
    // MARK: - Private properties
    private let person = Person.getPersonData()
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    // MARK: - Navigation
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userInfotVC = segue.destination as? UserInfoViewController else { return }
        userInfotVC.person = person
    }*/
    
    // MARK: - IBActions
    @IBAction func RegistationButton(_ sender: Any) {
    }
    
    

    
    
    
    
    
    // MARK: - Private Methods
    
    
}





/*
 Для возврата на первый экран через "ОТМЕНА", необходимо реализовать в классе первого StoryBoard’а  unwind(Segue).
Иначе не избежать повторного открывания этого окна вместо возврата к старому.
 
 class IntroductionViewController: UIViewController {
         
     @IBAction func unwind(segue: UIStoryboardSegue) {}
 }
 
 */
