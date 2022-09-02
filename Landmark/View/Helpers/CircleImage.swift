//
//  CircleImage.swift
//  Landmark
//
//  Created by Xcode on 01/09/22.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "turtlerock")
    }
}
