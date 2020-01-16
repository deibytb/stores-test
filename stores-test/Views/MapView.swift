//
//  MapView.swift
//  stores-test
//
//  Created by Deiby Toralva on 1/15/20.
//  Copyright © 2020 deibytb. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  
  var store: Store
  
  init(store: Store) {
    self.store = store
  }
  
  func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
    MKMapView(frame: .zero)
  }
  
  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    
    let latitude = CLLocationDegrees(Double(self.store.latitude) ?? 0.0)
    let longitude = CLLocationDegrees(Double(self.store.longitude) ?? 0.0)
    
    let location = CLLocationCoordinate2D(latitude: latitude,
                                          longitude: longitude)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
    uiView.setRegion(region, animated: true)
    
    let annotation = MKPointAnnotation()
    annotation.coordinate = location
    annotation.title = store.name
    annotation.subtitle = store.address
    uiView.addAnnotation(annotation)
  }
}
