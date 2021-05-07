//
//  SquirrelTrophy.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/22/21.
//

import SwiftUI
import AppDevWithSwiftLibrary
import CloudKit

struct SquirrelTrophy: View {

    @State var currentUsersSightings = Int()
    @State var userRank = String()

    var body: some View {
        
        VStack {
            
                
//            Text("Welcome " + String(accountUsername))
//                .foregroundColor(.black)
//            Text("You have sighted " + String(currentUsersSightings) + " squirrels")
//                .foregroundColor(.black)
//            Text(String(accountUsername) + ", you are a:")
//                .foregroundColor(.black)
                
             //   Text("Welcome " + String(accountUsername) + "! You have sighted " + String(currentUsersSightings) + " Squirrels!")
            VStack {
                Text("Welcome " + String(accountUsername) + "!")
                Text("You have sighted " + String(currentUsersSightings) + " Squirrels!")
                
                Text("You are a: " + userRank)
            }
            .foregroundColor(.black)
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
                        .foregroundColor(.black)
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
                        .foregroundColor(.black)
                    Text("11-30 Squirrels Sighted")
                        .foregroundColor(.black)
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
                        .foregroundColor(.black)
                    Text("31+ Squirrels Sighted")
                        .foregroundColor(.black)
                }
            }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
            //As our data view appears, need to fill in our information
            .onAppear(perform: {
                if (currentUsersSightings >= 0 && currentUsersSightings < 11) {
                    userRank = "Squirrel Friend!"
                }
                else if (currentUsersSightings >= 11 && currentUsersSightings < 31) {
                    userRank = "Squirrel Pro!"
                }
                else {
                    userRank = "Squirrel Expert!"
                }
                //A constant that will keep all of our data stored.
                cloud.getAll(dummy: NewSquirrelUser()) { (people) in
                    for person in people {
                        if person.username == accountUsername {
                        currentUsersSightings = Int(person.greySquirrelSightings + person.redSquirrelSightings)
                        }
                    }
                }
            })
        }
    }


struct SquirrelTrophy_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelTrophy()
    }
}

