//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNoteViewController: UIViewController {
    
    
    
    
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    var note: Note?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        }
        else {
            noteTitleTextField.text = "Your title"
            noteContentTextView.text = "Your content"
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        
        if segue.identifier == "save" {
            if let note = note {
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? ""
                listNotesTableViewController.tableView.reloadData()
                RealmHelper.updateNote(note, newNote: newNote)
                
            }else {
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = NSDate()
                RealmHelper.addNote(note)
            }
            listNotesTableViewController.notes = RealmHelper.retrieveNote()
            
            
            print("save button tapped")
            
        } else if segue.identifier == "cancel" {
            print("cancel button tapped")
        }
    }
    
    
}
