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
        
        if(username == nil || password == nil || confirmPassword == nil){
            signUpLabel.text = "You didn't enter anything!"
        } else {
        var data = UserDBHelper.users.signUp(username: username.text!, password: password.text!, confirmPassword: confirmPassword.text!)
        
        print(data)
        if(data){
            signUpLabel.text = "User created! Please login on the previous page!"
//            let welcomeScreen = storyboard?.instantiateViewController(withIdentifier: "tabs")
//            navigationController?.pushViewController(welcomeScreen!, animated: true)
        } else {
            signUpLabel.text = "Passwords do not match, try again!"
        }
            
        }
      
            
            
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let welcomeScreen = storyBoard.instantiateViewController(withIdentifier: "tabs")
//            present(welcomeScreen, animated: true, completion: nil)
            
       
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
