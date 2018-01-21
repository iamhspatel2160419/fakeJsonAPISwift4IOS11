//
//  NetworkService.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation

class NetworkService
{
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: NSURL
    
    init(url: NSURL) {
        
        self.url = url
    }
    
    typealias DataHandler = ((NSData) -> Void)
    
    func downloadData(completion: @escaping DataHandler)
    {
        let request = NSURLRequest(url: self.url as URL)
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch (httpResponse.statusCode) {
                    case 200:
                        if let data = data {
                            completion(data as NSData)
                        }
                    default:
                        print(httpResponse.statusCode)
                    }
                }
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
        dataTask.resume()
    }

}

extension NetworkService{
    static func parseJSONFromData(jsonData: NSData?) -> [[String: AnyObject]]?
    {
        if let data = jsonData{
            do{
                let jsonDictionary = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: AnyObject]]
                
                return jsonDictionary
                
            } catch let error as NSError {
            print("Error processing JSON Data \(error.description)")
            }
        }
        return nil
    }
}






















