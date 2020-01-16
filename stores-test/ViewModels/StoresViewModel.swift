//
//  StoresViewModel.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import Foundation
import Combine

class StoresViewModel: ObservableObject {
  
  private var storesService: StoresService
  
  @Published var stores: [Store] = []
    
  init() {
    self.storesService = StoresService()
    self.fetchStores()
  }
  
  private func fetchStores() {
    self.storesService.getStores { (stores) in
      if let stores = stores {
        DispatchQueue.main.async {
          self.stores = stores
        }
      }
    }
  }
  
}
