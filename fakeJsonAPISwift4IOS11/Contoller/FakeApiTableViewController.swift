//
//  FakeApiTableViewController.swift
//  fakeJsonAPISwift4IOS11
//
//  Created by hp ios on 1/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class FakeApiTableViewController: UITableViewController {

     let urlString = "https://jsonplaceholder.typicode.com/users"
    var mymodel = [MyModel]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getuserDetails()
        
        
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        
    }
    
    func getuserDetails()
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error ?? "")
            } else {
                do {
                   
                    if NetworkService.parseJSONFromData(jsonData: data as NSData?) != nil
                    {
                        if let jsonDict = NetworkService.parseJSONFromData(jsonData: data as NSData? )
                        {
                            for jsonD in jsonDict
                            {
                                let MM = MyModel.init(fakeapi: jsonD)
                                print(MM.addGeoLat ?? "")
                                print(MM.name ?? "")
                                print(MM.addressZipCode ?? "")
                                print(MM.companyCatchPhrase ?? "")
                                self.mymodel.append(MM)
                                DispatchQueue.main.async
                                    {
                                    self.tableView.reloadData()
                                }
                               
                                print(self.mymodel.count)
                            }
                            
                        }
                    }
                    
                    
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
        
        
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
