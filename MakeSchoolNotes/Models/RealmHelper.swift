//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Miriam Hendler on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(note)
        }
    }
    static func deleteNote(note: Note){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    }
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write(){
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    static func retrieveNote() -> Results<Note> {
        let realm = try! Realm()
       return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
}