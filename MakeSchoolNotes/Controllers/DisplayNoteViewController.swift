//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
  
  var note: Note?
  
  @IBOutlet weak var noteTitleTextField: UITextField!
  
  @IBOutlet weak var noteContentTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let note = note {
      noteTitleTextField.text = note.title
      noteContentTextView.text = note.content
    } else {
      noteTitleTextField.text = ""
      noteContentTextView.text = ""
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "Save" {
      // if note exists, update title and content
      let note = self.note ?? CoreDataHelper.newNote()
      note.title = noteTitleTextField.text ?? ""
      note.content = noteContentTextView.text ?? ""
      note.modificationTime = Date() as NSDate
      CoreDataHelper.saveNote()
    }
  }}
