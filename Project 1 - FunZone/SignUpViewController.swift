//
//  SignUpViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var signUpLabel: UILabel!
    
    @IBAction func signUpHandler(_ sender: Any) {
        let username = username.text!
        let password = password.text!
        let confirmPassword = confirmPassword.text!
        
        if(password == confirmPassword) {
            
            let welcomeScreen = storyboard?.instantiateViewController(withIdentifier: "tabs")
            navigationController?.pushViewController(welcomeScreen!, animated: true)
            
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let welcomeScreen = storyBoard.instantiateViewController(withIdentifier: "tabs")
//            present(welcomeScreen, animated: true, completion: nil)
            
        } else {
            signUpLabel.text = "The passwords don't match"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
