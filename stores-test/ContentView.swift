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
  
  @ObservedObject var storesVM: StoresViewModel
  
  init() {
    self.storesVM = StoresViewModel()
  }
  
  var body: some View {
    List(self.storesVM.stores, id:\.storeID) { store in
      HStack{
        KFImage(URL(string: store.storeLogoURL))
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 100, height: 100)
          .cornerRadius(16)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
