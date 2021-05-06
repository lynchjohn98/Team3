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
            VStack {
                
                VStack {
                Text("Squirrels are native to North America and other parts of the world.  They are very active animals so they are easily seen throughout the day.  Squirrels are an important indicator to our local environments because they live in a small territory and are active year round.  They need various resources that are also important to  other urban wildlife in the area. Their population numbers change and this affects other urban wildlife in the neighborhoods.  These population changes will affect prey and predators equilibrium and the environmental conditions of the wildlife in an urban area.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5.0)
                }
                VStack {
                Text("Fox squirrels spend most of their time on the ground searching for food and they prefer to be in an area that is next to Woodlands. Gray squirrels prefer areas with a dense tree population. The squirrel’s tail is a stabilizer for when they go airborne  between trees and branches. Fox squirrels are active through the day and sleep at night. Gray squirrels are most active early in the morning and late afternoon. These two types of squirrels may cross paths but don’t necessarily live in the same areas. Their predators are hawks, foxes, coyotes  and house cats.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5.0)
                }
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
