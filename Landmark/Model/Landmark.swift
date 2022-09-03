//
//  Landmark.swift
//  Landmark
//
//  Created by Xcode on 01/09/22.
//

import Foundation
import CoreLocation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var imageName: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    var featureImage: Image?{
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    
    private var coordinates: Coordinates
    
    var locationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

       struct Coordinates: Hashable, Codable {
           var latitude: Double
           var longitude: Double
       }
}
