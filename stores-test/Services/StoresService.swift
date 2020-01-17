//
//  StoresService.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import Foundation

class StoresService {
  
  enum APIError: Error {
    case parseUrl
    case noResponse
    case jsonDecodingError(error: Error)
    case networkError(error: Error)
  }
  
  func getStores(completion: @escaping (Result<[Store], APIError>) -> ()) {
    guard let url = URL(string: "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/stores.json") else {
      DispatchQueue.main.async {
        completion(.failure(.parseUrl))
      }
      return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      guard let data = data else {
        DispatchQueue.main.async {
          completion(.failure(.noResponse))
        }
        return
      }
      guard error == nil else {
        DispatchQueue.main.async {
          completion(.failure(.networkError(error: error!)))
        }
        return
      }
      do {
        let storesResponse = try JSONDecoder().decode(StoresResponse.self, from: data)
        DispatchQueue.main.async {
          completion(.success(storesResponse.stores))
        }
      } catch let error {
        DispatchQueue.main.async {
          #if DEBUG
          print("JSON Decoding Error: \(error)")
          #endif
          completion(.failure(.jsonDecodingError(error: error)))
        }
      }
    }.resume()
  }
  
}
