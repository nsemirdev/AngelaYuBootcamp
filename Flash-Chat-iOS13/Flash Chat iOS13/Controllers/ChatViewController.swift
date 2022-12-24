//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Constants.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: Constants.messageCellNib, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        db.collection("messages").order(by: "dateSent").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error!)
            }
            var messages = [Message]()
            for document in snapshot!.documents {
                let sender = document.data()["sender", default: "anonymous"] as! String
                let body = document.data()["body", default: "no message"] as! String
                messages.append(Message(sender: sender, body: body))
            }
            self.messages = messages
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func sendPressed(_ sender: UIButton) {
        guard messageTextfield.text != "" else { return }
        
        let messageBody = messageTextfield.text!
        let messageSender = Auth.auth().currentUser!.email!
        
        db.collection("messages").addDocument(data: [
            "sender": messageSender,
            "body": messageBody,
            "dateSent": Date().timeIntervalSince1970
        ]) { error in
            if error != nil {
                print(error!)
            }
        }
        
//        messages.append(Message(sender: messageSender, body: messageBody))
//        tableView.reloadData()
        messageTextfield.text = ""
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print(error)
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageBody.text = messages[indexPath.row].body
        return cell
    }
}
