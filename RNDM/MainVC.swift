//
//  MainVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/13/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit

enum ThoughtCategory : String {
    case serious = "serious"
    case funny = "funny"
    case crazy = "crazy"
    case popular = "popular"
}

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var thoughtTableView: UITableView!
    
    private var thoughtsArray = [Thought]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thoughtTableView.dataSource = self
        thoughtTableView.delegate = self
        thoughtTableView.estimatedRowHeight = 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughtsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtCell else { return UITableViewCell() }
        cell.configureCell(thought: thoughtsArray[indexPath.row])
        return cell
    }


}

