//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Tassos Lambrou on 6/8/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper {
  
  static let appDelegate = UIApplication.shared.delegate as! AppDelegate
  static let persistentContainer = appDelegate.persistentContainer
  static let managedContext = persistentContainer.viewContext
  //static methods will go here
  
  static func newNote() -> Note {
    let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
    return note
  }
  
  static func saveNote() {
    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Failed to save note properly. \(error)")
    }
  }
  
  static func delete(note: Note) {
    managedContext.delete(note)
    saveNote()
  }
  
  static func retrieveNotes() -> [Note] {
    let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
    do {
      let results = try managedContext.fetch(fetchRequest)
      return results
    } catch let error as NSError {
      print("Could not fetch \(error)")
    }
    return []
  }
  
}
