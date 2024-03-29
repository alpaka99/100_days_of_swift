//
//  ContentView-ViewModel.swift
//  [220922] swift_day_72
//
//  Created by user on 2022/09/22.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
//        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.locationManager.location?.latitude ?? 50, longitude: self.locationManager.location?.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published var mapRegion: MKCoordinateRegion
        @Published private (set) var locations: [Location]
        @Published var selectedPlace: Location?
        
        @Published var isUnlocked = false
        
        var locationFetcher: LocationFetcher
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
            
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
            locationFetcher = LocationFetcher()
        }
        
        func initialLocation() {
            locationFetcher.start()
            if let initLocation = locationFetcher.lastKnownLocation {
                mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: initLocation.latitude,longitude:  initLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
                print("Your location is \(initLocation.latitude) \(initLocation.longitude)")
            } else {
                print("No location")
            }
        }
        
    
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data :(")
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
            save()
        }
        
        func updateLocation(location: Location) {
            guard let selectedPlace = selectedPlace else {
                return
            }

            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
            save()
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        // error
                    }
                }
            } else {
                // no biometrics
            }
        }
    }
}
