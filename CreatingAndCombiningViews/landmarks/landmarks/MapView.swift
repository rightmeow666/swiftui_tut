//
//  MapView.swift
//  landmarks
//
//  Created by sudofluff on 12/16/19.
//  Copyright © 2019 sudofluff. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  
  func updateUIView(_ uiView: MapView.UIViewType, context: UIViewRepresentableContext<MapView>) {
    let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    uiView.setRegion(region, animated: true)
  }
  
  func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
    MKMapView(frame: .zero)
  }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
