//
//  StoreDetail.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct StoreDetail: View {
  
  let store: Store
  
  var body: some View {
    VStack {
      KFImage(URL(string: store.storeLogoURL))
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 250, height: 100)
      Text(store.name)
        .font(Font.headline)
      Text(store.phone)
        .font(Font.caption)
      Text(store.address)
        .font(Font.caption)
      
      Text(store.city)
        .font(Font.caption)
      Text(store.state)
        .font(Font.caption)
      Text(store.zipcode)
        .font(Font.caption)
      Text(store.latitude)
        .font(Font.caption)
      Text(store.longitude)
        .font(Font.caption)
    }
  }
}

struct StoreDetail_Previews: PreviewProvider {
  static var previews: some View {
    StoreDetail(store: Store(storeID: "1234",
                             storeLogoURL: "http://sandbox.bottlerocketapps.com/BR_Android_CodingExam_2015_Server/images/macys.jpeg",
                             name: "Macy's",
                             phone: "813-926-7300",
                             address: "7801 Citrus Park Town Center Mall",
                             city: "Tampa",
                             state: "FL",
                             zipcode: "33625",
                             latitude: "28.068052",
                             longitude: "-82.573301"))
  }
}
