//
//  LandmarkDatail.swift
//  Landmark
//
//  Created by Xcode on 01/09/22.
//

import SwiftUI

struct LandmarkDatail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinates)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                CircleImage(imageName: landmark.imageName)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    VStack {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            .foregroundColor(.black)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                        }
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
            }
        }
    }
}

struct LandmarkDatail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDatail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
