//
//  SingleNoteViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-27.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteBody: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNote(_ sender: Any) {
       
        NoteDBHelper.notes.addNote(title: noteTitle.text!, body: noteBody.text!)
        resultLabel.text = "Note Saved!"
    
    }

}
