//
//  LandmarkList.swift
//  Landmark
//
//  Created by Xcode on 01/09/22.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            
            List{
                Toggle(isOn: $showFavoriteOnly){
                    Text("Favorite Only")
                }
                
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink{
                        LandmarkDatail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
