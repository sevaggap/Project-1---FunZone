//
//  UpdateNoteViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-31.
//

import UIKit

class UpdateNoteViewController: UIViewController {

    var titleData : String? = " "
    var bodyData : String? = " "
    var noteId : Int64 = 0
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteBody: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTitle.text = titleData
        noteBody.text = bodyData

    }
    @IBAction func updateNote(_ sender: Any) {
        
        let newNoteTitle = noteTitle.text
        let newNoteBody = noteBody.text
        
        NoteDBHelper.notes.updateNote(noteId: noteId, title: newNoteTitle!, body: newNoteBody!)
        resultLabel.text = "Note Updated!"
        
    }

}
