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
  @Published var errorMessage: String = ""
  
  init() {
    self.storesService = StoresService()
    self.fetchStores()
  }
  
  private func fetchStores() {
    self.storesService.getStores { (result) in
      switch result {
      case let .success(stores):
        DispatchQueue.main.async {
          self.stores = stores
        }
      case let .failure(error):
        DispatchQueue.main.async {
          self.errorMessage = error.localizedDescription
        }
      }
    }
  }
}
