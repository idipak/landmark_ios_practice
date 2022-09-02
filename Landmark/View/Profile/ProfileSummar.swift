//
//  ProfileSummar.swift
//  Landmark
//
//  Created by Xcode on 02/09/22.
//

import SwiftUI

struct ProfileSummar: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notification: \(profile.prefersNotifications ? "ON" : "OFF")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Completed Badge")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "First Hike")
                            
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                VStack{
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummar(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
