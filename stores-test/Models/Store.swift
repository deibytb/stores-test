//
//  Store.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import Foundation

struct StoresResponse: Decodable {
  let stores: [Store]
}

struct Store: Decodable {
  var storeID: String
  var storeLogoURL: String
  var name: String
  var phone: String
  var address: String
  var city: String
  var state: String
  var zipcode: String
  var latitude: String
  var longitude: String
}
