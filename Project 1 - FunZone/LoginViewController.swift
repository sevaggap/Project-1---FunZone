//
//  LoginViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    let userDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        loginLabel.text = "Please enter your username and password:"
        switchStatus()
    }

    func switchStatus(){
        let switchStatus = userDefaults.bool(forKey: "switch")
        let keyUsername = userDefaults.value(forKey: "username") as? String
        if(switchStatus){
            print(switchStatus)
            rememberSwitch.setOn(true, animated: false)
            username.text = keyUsername
            viewKey()
        } else {
            print(switchStatus)
            rememberSwitch.setOn(false, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        if (rememberSwitch.isOn) {
            userDefaults.set(true, forKey: "switch")
            userDefaults.set(username.text, forKey: "username")
            print(userDefaults.bool(forKey: "switch"))
            print("switch is on")
            saveKey()
            viewKey()
        } else {
            userDefaults.set(false, forKey: "switch")
            userDefaults.set(nil, forKey: "username")
            print(userDefaults.bool(forKey: "switch"))
            print("switch is off")
            deleteKey()
        }
    }
    
    @IBAction func loginHandler(_ sender: Any) {
        var data = UserDBHelper.users.login(username: username.text!, password: password.text!)
        
        if(data) {
            let welcomeScreen = storyboard?.instantiateViewController(withIdentifier: "tabs")
            navigationController?.pushViewController(welcomeScreen!, animated: true)
        } else {
            loginLabel.text = "Username or password is not correct, please try again!"
        }
    }
    
    func saveKey(){
        let attribute : [String : Any] =  [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : username.text, kSecValueData as String : password.text!.data(using: .utf8)]
        if SecItemAdd(attribute as CFDictionary, nil)  == noErr {
            print("data saved to keychain successfully")
        } else {
            print("ran into some errors")
        }
    }
    
    func deleteKey(){
        let req : [String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : username.text]
        
        if SecItemDelete(req as CFDictionary) == noErr {
            print("data deleted from keychain")
        } else {
            print("got some error")
        }
    }
    
    func viewKey(){
     
        let req : [String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : username.text!, kSecReturnAttributes as String : true, kSecReturnData as String : true]
        
        var res : CFTypeRef?
        
        if SecItemCopyMatching(req as CFDictionary, &res) == noErr {
            
            let data = res as? [String : Any]
            let keyUsername = data![kSecAttrAccount as String] as? String
            let keyPassword = (data![kSecValueData as String] as? Data)!
            // decrypting it
            let pass = String(data: keyPassword, encoding: .utf8)
            
            // setting text fields if there is a key
            print("here",keyUsername,pass)
            password.text = pass
        } else {
            print("no key")
        }
        
    }
    
    func updateKey(){
        
        let req : [String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : username.text]
        
        let attribute : [String : Any] = [kSecValueData as String : password.text!.data(using: .utf8)]
        
        if SecItemUpdate(req as CFDictionary, attribute as CFDictionary) == noErr {
            print("keychain updated")
        } else {
            print("got some error - update")
        }
        
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
