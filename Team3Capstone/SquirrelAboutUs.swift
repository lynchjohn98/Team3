//
//  SquirrelAboutUs.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//

import SwiftUI

struct SquirrelAboutUs: View {
    var body: some View {
        VStack {
            Text("About The App")
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .font(.title2)
            Spacer()
                .frame(width: 50, height: 50)
            HStack {
                
                Text("Squirrels are native to North America and other parts of the world.  They are very active animals so they are easily seen throughout the day.  Squirrels are an important indicator to our local environments because they live in a small territory and are active year round.  They need various resources that are also important to  other urban wildlife in the area. Their population numbers change and this affects other urban wildlife in the neighborhoods.  These population changes will affect prey and predators equilibrium and the environmental conditions of the wildlife in an urban area.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5.0)
                    
             
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
}

struct SquirrelAboutUs_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelAboutUs()
    }
}
