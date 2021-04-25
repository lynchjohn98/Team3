//
//  ContentView.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/19/21.
//

//Need to use Scaled to Fit more often on our app
//Will need to add that modifier to the images currently created

//For our data model: a user using this app will have
// Username
// Amount of Squirrels Sighted
// UUID
// Potential : users location?
// Potential : do we have to have username attached to email/phone number

import SwiftUI

struct User : Hashable, Codable {
    var id = UUID()
    var userName = String()
    var squirrelSightings = Int()
}

var userTest = User(userName: "JohnTest", squirrelSightings: 100)

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            Group{
                
                VStack {
                    
                    Spacer()
                    
                    //Title Vertical Stack
                    VStack {
                        Text("Where are the Squirrels?")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .background(Image("titlePageSquirrel")
                                            .resizable()
                                            .frame(width:400, height: 400))
                    }
                    
                    Spacer()
                    
                    //Caption vertical stack
                    VStack {
                        Text("Help Monitor the Environmental Conditions that affect our Neighborhood Wildlife")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    
                    //Get started button vertical stack
                    VStack {
                        NavigationLink(
                            destination: SquirrelSighting(),
                            label: {
                                Text("I See a Squirrel!")
                                    .foregroundColor(.black)
                                    .background(Image("squirrelCartoon")
                                                    .resizable()
                                                    .frame(width:200,height:200))
                            })
                    }
                    Spacer()
                        .frame(width: 50.0, height: 100)
                    
                    
                    //HStack at bottom to navigate through each page
                    //Link the sighting to the trophy. After someone puts in a squirrel it will link to a trophy case
                    HStack {
                        NavigationLink(
                            destination: SquirrelSighting(),
                            label: {
                                Text(Image(systemName: "location.circle.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelData(),
                            label: {
                                Text(Image(systemName: "mappin.and.ellipse"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelTrophy(),
                            label: {
                                Text(Image(systemName: "questionmark.circle.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelAboutUs(),
                            label: {
                                Text(Image(systemName: "book.circle.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelUserPictures(),
                            label: {
                                Text(Image(systemName: "camera.circle.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                    }
                    .frame(width:500, height:50)
                    .background(Color.orange)
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
