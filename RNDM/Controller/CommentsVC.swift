//
//  CommentsVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/24/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var commentsTextField: UITextField!
    
    var thought: Thought!
    var commentsArray = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentsTableView.delegate = self
        commentsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCommentButtonPressed(_ sender: Any) {
    }
    
    // MARK: TableView Protocols
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as? CommentCell else { return UITableViewCell() }
        cell.configureCell(comment: commentsArray[indexPath.row])
        return cell
    }
    
    

}
