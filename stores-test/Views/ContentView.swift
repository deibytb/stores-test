//
//  ContentView.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
  
  @State private var searchTerm: String = ""
  
  @ObservedObject var storesVM: StoresViewModel
  
  init() {
    self.storesVM = StoresViewModel()
  }
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBarView(searchText: self.$searchTerm)
        
        List(self.storesVM.stores.filter {
          self.searchTerm.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(self.searchTerm)
        }, id:\.storeID) { store in
          NavigationLink(destination: StoreDetail(store: store)) {
            StoreCell(store: store)
          }
        }
        
      }
    .navigationBarTitle("Stores")
    
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StoreCell: View {
  
  let store: Store
  
  var body: some View {
    HStack{
      KFImage(URL(string: store.storeLogoURL))
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
      VStack(alignment: .leading) {
        Text(store.name)
          .font(Font.headline)
        Text(store.phone)
          .font(Font.caption)
        Text(store.address)
          .font(Font.caption)
      }
    }
  }
  
}
