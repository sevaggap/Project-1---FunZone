//
//  NoteDBHelper.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-31.
//

import Foundation
import UIKit
import CoreData

class NoteDBHelper {
    
    static var notes = NoteDBHelper()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func getNotes() -> [UsersNotes]{
        
        var notes = [UsersNotes]()
        
        // prepare request to get data from database, specify for what entity or table in the database
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersNotes")
        
        do{
            notes = try context?.fetch(fetchRequest) as! [UsersNotes]
        } catch {
            print("can not fetch data")
        }
        
        return notes
        
    }
    
    func addNote(title : String, body : String) {
        
        let note = NSEntityDescription.insertNewObject(forEntityName: "UsersNotes", into: context!) as! UsersNotes
        note.noteId =  Int64.random(in: 1...1000000)
        note.title = title
        note.body = body
        
        do{
            try context?.save()
            print("note save")
        } catch {
            print("note not saved")
        }
    
    }
    
    func updateNote(noteId : Int64, title : String, body : String) {
        
        var note = UsersNotes()
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersNotes")
        fetchRequest.predicate = NSPredicate(format: "noteId == %@", String(noteId))
        
        do {
            let updatedNote = try context?.fetch(fetchRequest)
            if(updatedNote?.count != 0){
                note = updatedNote?.first as! UsersNotes
                note.title = title
                note.body = body
                try context?.save()
                print("note updated")
            }
        } catch {
            print("not not updated, error")
        }
        
    }
    
    func deleteNote(noteId : Int64) {
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UsersNotes")
        fetchRequest.predicate = NSPredicate(format: "noteId == %@", String(noteId))
        
        do {
            let deleteNote  = try context?.fetch(fetchRequest)
            if(deleteNote?.count != 0){
                context?.delete(deleteNote?.first as! UsersNotes)
                try context?.save()
                print("note deleted")
            } else {
                print("no not found")
            }
        } catch {
            print("ran into some errors")
        }
    }
}
