//
//  MapViewModel.swift
//  CoffeeHunt
//
//  Created by Александра Наврузова on 09/05/2023.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine

class MapViewModel: ObservableObject {
    private let locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()
    
    var latitude: CLLocationDegrees {
        return locationManager.location?.coordinate.latitude ?? 0
    }
    
    var longitude: CLLocationDegrees {
        return locationManager.location?.coordinate.longitude ?? 0
    }
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        
        locationManager.$location
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }.store(in: &cancellables)
    }
}
