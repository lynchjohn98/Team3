//
//  SquirrelSighting.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//  Create a new view for each of the screens

import SwiftUI
import AppDevWithSwiftLibrary
import Foundation
import MapKit

struct SquirrelSighting: View {
    
    //Simple binary representation 0 is for grey, 1 is for red
    @State var squirrelSelection : Int = -1
    @State var greySquirrelSelected : Bool = false
    @State var redSquirrelSelected : Bool = false
    
    //Location tracker for when the user enters in their sighting
    @State var location = LocationFetcher()
    
    //Two alert messages, one if the user has not created an account (cannot track them if they haven't), and one if the user hits enter without selecting anything
    
    //Cannot attach two alerts to the same VStack. Should be able to put two alerts on two different views in the VStack
    @State var showError = false
    @State var errorMessage : String = ""
    
    var body: some View {
        
        VStack {
            
            
            VStack {
                
                Text("Select the Squirrel You See!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(width: 2, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            //After the first two lines of text, here the user can select which squirrel they currently see
            //First HStack for the Grey Fox Squirrel
            HStack {
                
                Button(action: {
                    greySquirrelSelected.toggle()
                    if (redSquirrelSelected){
                        redSquirrelSelected.toggle()
                    }
                    
                }, label: {
                    
                    if greySquirrelSelected {
                        Image("squirrelSelectGrey")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay(Circle()
                                        .stroke(Color.orange, lineWidth: 4))
                    }
                    else {
                        Image("squirrelSelectGrey")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width:175, height:175, alignment: .leading)
                    }
                })
                VStack {
                    Text("Grey Fox Squirrel")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Grey Backs")
                    Text("White or Grey Bellies")
                    Text("White-Fringed Tails")
                }
            }
            
            //Second HStack for the Red Fox Squirrel
            HStack {
                Button(action: {
                    redSquirrelSelected.toggle()
                    if (greySquirrelSelected) {
                        greySquirrelSelected.toggle()
                    }
                }, label: {
                    if redSquirrelSelected {
                        Image("squirrelSelectRed")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                            .overlay(Circle()
                                        .stroke(Color.orange, lineWidth: 4))
                    }
                    else {
                        Image("squirrelSelectRed")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                })
                VStack {
                    Text("Red Fox Squirrel")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Orange/Rust back")
                    Text("Orange Bellies")
                    Text("Black-Fringed Tails")
                    
                }
                .padding()
            }
            
            VStack {
                Spacer()
                //For the different error message
                
                Button(action: {
                    //Give another check if the user has an account, just so that adding data later doesn't need to check for this
                    if (!createdAccount) {
                        showError = true
                        errorMessage = "Please create an account before entering a sighting!"
                    }
                    //Check if neither are selected, if neither are then alert the user to select one
                    if (!greySquirrelSelected && !redSquirrelSelected) {
                        showError = true
                        errorMessage = "You need to pick the squirrel you saw first!"
                    }
                    
                    //Both passes are okay, means the user has an account and has made a selection properly
                    //Here we will need to 
                    else {
                        cloud.getAll(dummy: NewSquirrelUser()) {
                            (people) in
                            for person in people {
                                //Check if this is our current user of the app
                                //Make a note of this here
                                if person.id.uuidString == cloud.getUserID() {
                                    //Grab the sighting location via finding the users current location
                                    let currentLocation = location.lastKnownLocation
                                    let squirrelSighting : SquirrelLocation = SquirrelLocation(latitiude: Double(currentLocation!.latitude), longitude: Double( currentLocation!.longitude))
                                    var updatedUserData = person
                                    print("Found user's current location")
                                    print(squirrelSighting)
                                    updatedUserData.squirrels.append(squirrelSighting)
                                    if (greySquirrelSelected) {
                                        updatedUserData.greySquirrelSightings += 1
                                        cloud.save(data: updatedUserData)
                                    }
                                    if (redSquirrelSelected) {
                                        updatedUserData.redSquirrelSightings += 1
                                        cloud.save(data: updatedUserData)
                                    }
                                }
                            }
                        }
                    }
                }, label: {
                    Image("AcornSighting")
                        .resizable()
                        .frame(width:350,height:200)
                })
                
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error!"), message: Text(errorMessage), dismissButton: .default(Text("Got it!")))
                }
                Spacer()
            }
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
        .onAppear(perform: {
            
            //Start location services
            location.start()
            
        })
    }
    
}


struct SquirrelSighting_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelSighting()
    }
}



