//
//  FakeApiTableViewCell.swift
//  fakeJsonAPISwift4IOS11
//
//  Created by hp ios on 1/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class FakeApiTableViewCell: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var cBs: UILabel!
    @IBOutlet weak var cPhrase: UILabel!
    @IBOutlet weak var cname: UILabel!
    @IBOutlet weak var Website: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var Long: UILabel!
    @IBOutlet weak var Lat: UILabel!
    @IBOutlet weak var zipcode: UILabel!
    @IBOutlet weak var suit: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var name: UILabel!
    
    var mymodel : MyModel!
    {
        didSet {
            self.updateUI()
        }
    }
    func updateUI()
    {
        id.text = mymodel.id
        city.text = mymodel.addressCity
        cBs.text = mymodel.companyBs
        cPhrase.text = mymodel.companyCatchPhrase
        cname.text = mymodel.companyName
        Website.text = mymodel.website
        phone.text = mymodel.phone
        Lat.text = mymodel.addGeoLat
        Long.text = mymodel.addGeoLon
        zipcode.text = mymodel.addressZipCode
        suit.text = mymodel.addressSuit
        street.text = mymodel.addressStreet
        email.text = mymodel.email
        username.text = mymodel.username
        name.text = mymodel.name
        
    }
    
    
    
}
