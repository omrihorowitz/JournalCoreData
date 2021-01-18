//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Omri Horowitz on 1/18/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = " "
        bodyTextView.text = " "
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard let bodytext = bodyTextView.text, !bodytext.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodytext: bodytext)
        } else {
            EntryController.shared.createEntry(title: title, bodytext: bodytext)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
    }
}
