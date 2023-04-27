//
//  MapView.swift
//  CoffeeHunt
//
//  Created by Sasha Navruzova on 25/04/2023.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

struct MapView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    private let zoom: Float = 15.0

    func makeUIView(context: Context) -> GMSMapView {
        
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            fatalError("Couldn't find configuration file")
        }
        let config = NSDictionary(contentsOfFile: path)
        guard let apiKey = config?["GoogleMapsAPIKey"] as? String else {
            fatalError("Couldn't find Google Maps API key in configuration file")
        }
        
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.latitude, longitude: locationManager.longitude, zoom: zoom)
        mapView.camera = camera
        mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locationManager.latitude, longitude: locationManager.longitude))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
