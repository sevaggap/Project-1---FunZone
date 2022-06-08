//
//  NoteViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit

class NoteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // static makes the variable avialable across application
    static var notes = [UsersNotes]()

    @IBOutlet weak var table: UITableView!
    
    static var tableObj : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        NoteViewController.notes = NoteDBHelper.notes.getNotes()
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NoteViewController.notes = NoteDBHelper.notes.getNotes()
        NoteViewController.tableObj = table

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NoteViewController.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotesTableViewCell
        
        cell.notesTitle.text = NoteViewController.notes[indexPath.row].title
        cell.noteId =  NoteViewController.notes[indexPath.row].noteId
    
        return cell
    }
    
    //use this function to do something when you press the row - like to to the actual view with the title and body of the notes
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let updateNoteScreen = storyboard?.instantiateViewController(withIdentifier: "updateNote") as! UpdateNoteViewController
        updateNoteScreen.titleData = NoteViewController.notes[indexPath.row].title
        updateNoteScreen.bodyData = NoteViewController.notes[indexPath.row].body
        updateNoteScreen.noteId = NoteViewController.notes[indexPath.row].noteId
        navigationController?.pushViewController(updateNoteScreen, animated: true)
    }

}
