//
//  Landmark.swift
//  Landmark
//
//  Created by Xcode on 01/09/22.
//

import Foundation
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    var imageName: String
    
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

       struct Coordinates: Hashable, Codable {
           var latitude: Double
           var longitude: Double
       }
}
