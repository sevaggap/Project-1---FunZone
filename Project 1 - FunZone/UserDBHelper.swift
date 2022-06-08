//
//  UserBDHelper.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-31.
//

import Foundation
import UIKit
import CoreData

class UserDBHelper {
    
    static var users = UserDBHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func signUp(username : String, password : String, confirmPassword : String) -> Bool{
        
        if(password == confirmPassword){
            let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
            user.username = username
            user.password = password
        
            do {
                try context?.save()
                print("user added to datbase")
                return true
            } catch {
                print("got some error")
            }
        } else {
            print("password do not match!")
            return false
        }
    
        return false
    }
    
    func login(username : String, password : String) -> Bool{
        var user = Users()
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        fetchRequest.fetchLimit = 1
        
        do {
            let request = try context?.fetch(fetchRequest) as! [Users]
            if (request.count != 0 && request.first?.password == password){
                user = request.first as!  Users
                return true
            } else {
                print("user not found")
                return false
            }
        } catch {
            print("ran into an error")
        }
        
        return false
        
    }
    
}
