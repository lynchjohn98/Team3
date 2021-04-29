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


struct ContentView: View {
    
    var body: some View {
        
        //To make the background different color
        
        NavigationView {
            
            Group {
                
                VStack {
                    
                    Text("Where are the Squirrels?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        Text("Help Monitor the Environmental Conditions")
                        
                    }
                    
                    Spacer()
                        .background(Image("titlePageSquirrel")
                                        .resizable()
                                        .frame(width: 400, height: 400))
                    
                    
                    Spacer()
                        .frame(height: 50.0)
                    
                    //Get started button vertical stack
                    HStack {
                        NavigationLink(
                            destination: SquirrelSighting(),
                            label: {
                                Text("I See A Squirrel!")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.green)
                                    .background(Image("acorn")
                                                    .resizable()
                                                    .frame(width:225,height:190))
                            })
                        Spacer()
                            .frame(width:50)
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
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
            }
        }
    }
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
