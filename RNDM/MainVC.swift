//
//  MainVC.swift
//  RNDM
//
//  Created by Kyle Johannsen on 8/13/19.
//  Copyright © 2019 Kyle Johannsen. All rights reserved.
//

import UIKit
import Firebase

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
    private var thoughtsCollectionRef: CollectionReference!
    private var thoughtsListener: ListenerRegistration!
    private var selectedCategory = ThoughtCategory.funny.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thoughtTableView.dataSource = self
        thoughtTableView.delegate = self
        thoughtTableView.estimatedRowHeight = 80
        
        thoughtsCollectionRef = Firestore.firestore().collection(THOUGHTS_REF)
    }
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: selectedCategory = ThoughtCategory.funny.rawValue
        case 1: selectedCategory = ThoughtCategory.serious.rawValue
        case 2: selectedCategory = ThoughtCategory.crazy.rawValue
        default: selectedCategory = ThoughtCategory.popular.rawValue
        }
        
        thoughtsListener.remove()
        setListener()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setListener()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        thoughtsListener.remove()
    }
    
    func setListener() {
        if selectedCategory == ThoughtCategory.popular.rawValue {
            thoughtsListener = thoughtsCollectionRef
                .order(by: NUM_LIKES, descending: true)
                .addSnapshotListener { (snapshot, error) in
                    if let error = error {
                        debugPrint("Error fetching docs: \(error)")
                    } else {
                        self.thoughtsArray = []
                        self.thoughtsArray = Thought.parseData(snapshot: snapshot)
                        self.thoughtTableView.reloadData()
                    }
            }
        } else {
            thoughtsListener = thoughtsCollectionRef
                .whereField(CATEGORY, isEqualTo: selectedCategory)
                .order(by: TIMESTAMP, descending: true)
                .addSnapshotListener { (snapshot, error) in
                if let error = error {
                    debugPrint("Error fetching docs: \(error)")
                } else {
                    self.thoughtsArray = []
                    self.thoughtsArray = Thought.parseData(snapshot: snapshot)
                    self.thoughtTableView.reloadData()
                }
            }
        }
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

