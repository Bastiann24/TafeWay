//
//  ViewController.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 12/8/21.
//

import UIKit

class LoginScreenController: UIViewController {

    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    @IBAction func logInClicked(_ sender: UIButton) {
        let alertController = UIAlertController (title: "LOGGED IN", message: String(format:"Welcome to TafeWay " + emailLabel.text!), preferredStyle: .alert)
        
        let alertAction =   UIAlertAction(title: "Thanks!", style: .default, handler: nil)
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

