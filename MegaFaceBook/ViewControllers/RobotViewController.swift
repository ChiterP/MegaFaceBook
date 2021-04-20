//
//  RobotViewController.swift
//  MegaFaceBook
//
//  Created by Никита  on 17.04.2021.
//

import UIKit

class RobotViewController: UIViewController {
    
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var autoFirstButton: UIButton!
    @IBOutlet var otherImageButton: UIButton!
    @IBOutlet var autoSecondButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    var currenPage = 1
    var countOfAutoImage = 0
    var countOfOtherImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectButton(_ sender: UIButton) {
        switch sender {
        case autoFirstButton:
            changeAlpha(for: autoFirstButton)
        case autoSecondButton:
            changeAlpha(for: autoSecondButton)
        default:
            changeAlpha(for: otherImageButton)
        }
    }
    
    @IBAction func selectDoneButton() {
        
        switch currenPage {
        case 1:
            autoFirstButton.setImage(UIImage(named: "auto3"), for: .normal)
            otherImageButton.setImage(UIImage(named: "train"), for: .normal)
            autoSecondButton.setImage(UIImage(named: "auto4"), for: .normal)
            currenPage += 1
            autoFirstButton.alpha = 1
            autoSecondButton.alpha = 1
            otherImageButton.alpha = 1
        case 2:
            autoFirstButton.setImage(UIImage(named: "auto5"), for: .normal)
            otherImageButton.setImage(UIImage(named: "plane"), for: .normal)
            autoSecondButton.setImage(UIImage(named: "auto6"), for: .normal)
            currenPage += 1
            autoFirstButton.alpha = 1
            autoSecondButton.alpha = 1
            otherImageButton.alpha = 1
            doneButton.setTitle("Done", for: .normal)
        default:
            if countOfAutoImage != 6 || countOfOtherImage != 0 {
                currenPage = 0
                countOfAutoImage = 0
                countOfOtherImage = 0
                showAlert(title: "Warning!" , message: "Похоже, что вы Робот, попробуйте еще раз!")
                autoFirstButton.setImage(UIImage(named: "auto1"), for: .normal)
                otherImageButton.setImage(UIImage(named: "train2"), for: .normal)
                autoSecondButton.setImage(UIImage(named: "auto2"), for: .normal)
                currenPage = 1
                autoFirstButton.alpha = 1
                autoSecondButton.alpha = 1
                otherImageButton.alpha = 1
                doneButton.setTitle("Next", for: .normal)
            }
            else {
                showAlert(title: "Поздравляю!", message: "Можете продолжить регистрацию")
                currenPage = 0
                countOfAutoImage = 0
                countOfOtherImage = 0
            }
        }
    }
    
    func changeAlpha (for button: UIButton) {
        if button.alpha == 1 {
            button.alpha = 0.5
            if button == otherImageButton {
                countOfOtherImage += 1
            } else {
                countOfAutoImage += 1
            }
        } else {
            button.alpha = 1
            if button == otherImageButton {
                countOfOtherImage -= 1
            } else {
                countOfAutoImage -= 1
            }
        }
    }
    
}

extension RobotViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
