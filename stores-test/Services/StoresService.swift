//
//  StoresService.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import Foundation

class StoresService {
  
  func getStores(completion: @escaping ([Store]?) -> ()) {
    guard let url = URL(string: "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/stores.json") else {
      completion(nil)
      return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      guard let data = data, error == nil else {
        completion(nil)
        return
      }
      
      let storesResponse = try? JSONDecoder().decode(StoresResponse.self, from: data)
      
      if let storesResponse = storesResponse {
        let response = storesResponse.stores
        completion(response)
      } else {
        completion(nil)
      }
      
    }.resume()
  }
  
}
