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
    @State var presentAccountSheet = false
    @State var accountUsername = ""
    @State var currentUsername : String = "new user"
    
    var body: some View {
        
        VStack {
            
            HStack {

                Button(action: {
                    presentAccountSheet = true
                }, label: {
                    Image(systemName: "house")
                })
            } .sheet(isPresented: $presentAccountSheet) {
                Text("Welcome to your new account! Please enter a username")
                    .multilineTextAlignment(.center)
                TextField("Enter your Username", text: $accountUsername)
                    .multilineTextAlignment(.center)
                Button(action: {
                    let newUser = User(username: accountUsername, greySquirrelSightings: 0, redSquirrelSightings: 0)
                    newUser.save()
                    currentUsername = accountUsername
                    presentAccountSheet = false
                }, label: {
                    Text("Submit")
                })
            }
            
            Text("Welcome " + currentUsername)
            
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
                let squirrelCount = 0
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
}

struct SquirrelTrophy_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelTrophy()
    }
}
