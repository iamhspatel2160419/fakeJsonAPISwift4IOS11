//
//  FakeApiTableViewController.swift
//  fakeJsonAPISwift4IOS11
//
//  Created by hp ios on 1/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class FakeApiTableViewController: UITableViewController {

   lazy var mymodel = [MyModel]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mymodel = MyModel.downloadAllData()
       
        self.tableView.reloadData()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mymodel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mymodel Cell", for: indexPath) as! FakeApiTableViewCell
        let mymodel = self.mymodel[indexPath.row]
        
        cell.mymodel = mymodel
        
        return cell
    }
    
}
