//
//  MyModel.swift
//  fakeJsonAPISwift4IOS11
//
//  Created by hp ios on 1/20/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
class MyModel
{
    var id: String?
    var name: String?
    var username: String?
    var email:String?
    var addressStreet: String?
    var addressSuit: String?
    var addressCity: String?
    var addressZipCode: String?
    var addGeoLat: String?
    var addGeoLon: String?
    var phone: String?
    var website: String?
    var companyName: String?
    var companyCatchPhrase: String?
    var companyBs: String?
    
    init(id:String,name:String,username:String,
         email:String,
         addressStreet:String,
         addressSuit:String,
         addressCity:String,
         addressZipCode:String,
         addGeoLat:String,
         addGeoLon:String,
         phone:String,
         website:String,
         companyName:String,
         companyCatchPhrase:String,
         companyBs:String
         )
    {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.addressStreet = addressStreet
        self.addressSuit = addressSuit
        self.addressCity = addressCity
        self.addressZipCode = addressZipCode
        self.addGeoLat = addGeoLat
        self.addGeoLon = addGeoLon
        self.phone = phone
        self.website = website
        self.companyName = companyName
        self.companyCatchPhrase = companyCatchPhrase
        self.companyBs = companyBs
    }

    init(fakeapi:[String:AnyObject])
    {
//        self.id = String(describing: fakeapi["id"] as? Int)
//        self.name = fakeapi["name"] as? String
//        username = fakeapi["username"] as? String
//        email = fakeapi["email"] as? String
//        phone = fakeapi["phone"] as? String
//        phone = fakeapi["phone"] as? String
//        website = fakeapi["website"] as? String
        
        if let rollnumber =  fakeapi["id"] as? Int
        {
            self.id = String(rollnumber)
        }
        if let name = fakeapi["name"] as? String
        {
             self.name = name
        }
        
        if let username = fakeapi["username"] as? String
        {
           self.username = username
        }
        if let email = fakeapi["email"] as? String
        {
             self.email = email
        }
        if let phone = fakeapi["phone"] as? String
        {
               self.phone = phone
        }
        if let website = fakeapi["website"] as? String
        {
             self.website = website
        }
        if fakeapi["company"] as? [String:AnyObject] != nil
        {
            if let company = fakeapi["company"] as? [String:AnyObject]
            {
                if let companyName = company["name"] as? String
                {
                    print("companyName = \(companyName)")
                    self.companyName = companyName
                }
                if let companyCatchPhrase = company["catchPhrase"] as? String
                {
                    
                    self.companyCatchPhrase = companyCatchPhrase
                }
                if let companyName = company["bs"] as? String
                {
                    self.companyBs = companyName
                }
            }
        }
        
        if fakeapi["address"] as? [String:AnyObject] != nil
        {
            
            if let addressCity = fakeapi["address"] as? [String:AnyObject]
            {
               if let addressStreet = addressCity["street"] as? String
               {
                print("addressStreet = \(addressStreet)")
                  self.addressStreet = addressStreet
               }
               if let addresssuite = addressCity["suite"] as? String
               {
                   self.addressSuit = addresssuite
               }
                if let addresszipcode = addressCity["zipcode"] as? String
                {
                     self.addressZipCode = addresszipcode
                }
                if let addresscity = addressCity["street"] as? String
                {
                    self.addressCity = addresscity
                }
                if let addressGeo = addressCity["geo"] as? [String:AnyObject]
                 {
                    if let addressGeoLat = addressGeo["lat"] as? String
                    {
                         print("addressGeoLat = \(addressGeoLat)")
                        self.addGeoLat = addressGeoLat
                    }
                    if let addressGeoLon = addressGeo["lng"] as? String
                    {
                        self.addGeoLon = addressGeoLon
                    }
                 }
            }
        }
        
        
      
       
        
        
    }
    
    static func downloadAllData() -> [MyModel]
    {
        var allMyModel = [MyModel]()
        
        
        NetworkService(url: NSURL(string: "https://jsonplaceholder.typicode.com/users")!)
            .downloadData(completion:
                {
                   (data) in
        
         if NetworkService.parseJSONFromData(jsonData: data) != nil
         {
            if let jsonDict = NetworkService.parseJSONFromData(jsonData: data)
            {
                
                for jsonD in jsonDict
                {
                let newFakeDataPack1 = MyModel.init(fakeapi: jsonD)
                  
                   allMyModel.append(newFakeDataPack1)
                }
                
            }
         }
        
            
        })
        return allMyModel
    }
    
}

