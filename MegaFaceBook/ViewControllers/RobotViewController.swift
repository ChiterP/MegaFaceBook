//
//  RobotViewController.swift
//  MegaFaceBook
//
//  Created by Никита  on 17.04.2021.
//

import UIKit

class RobotViewController: UIViewController {
    
    @IBOutlet weak var labelUI: UILabel!
    
    @IBOutlet var autoFirtstImage: UIImageView!
    @IBOutlet var trainFirstIMAGE: UIImageView!
    @IBOutlet var autoSecondImage: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getTapImage(_ sender: Any) {
        if let _ = sender as? UIImage {
            view.backgroundColor = .red
        }
    }
    


}
