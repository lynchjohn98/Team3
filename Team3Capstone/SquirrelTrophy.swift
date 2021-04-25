//
//  SquirrelTrophy.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/22/21.
//

import SwiftUI

struct SquirrelTrophy: View {
    var body: some View {
        VStack {
            Text("Where are the Squirrels?")
            
            
            HStack {
                Image("squirrelCartoon")
                    .resizable()
                    .frame(width:200, height:200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                VStack {
                    Text("Squirrel Friend")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("1-10 Squirrels Sighted")
                }
            }
            HStack {
                Image("squirrelCartoon")
                    .resizable()
                    .frame(width:200, height:200)
                    .clipShape(Circle())
                    .scaledToFit()
                VStack {
                    Text("Squirrel Pro")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("11-30 Squirrels Sighted")
                }
            }
            HStack {
                Image("squirrelCartoon")
                    .resizable()
                    .frame(width:200, height:200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                VStack {
                    Text("Squirrel Expert")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("31+ Squirrels Sighted")
                }
            }
            Text("You are:")
            VStack {
                let squirrelCount = userTest.squirrelSightings
                if (squirrelCount >= 0 && squirrelCount < 11) {
                    Text("Squirrel Friend")
                }
                else if (squirrelCount >= 11 && squirrelCount < 31) {
                    Text("Squirrel Pro")
                }
                else {
                    Text("Squirrel Expert")
                }
            }
        }
    }
}

struct SquirrelTrophy_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelTrophy()
    }
}
