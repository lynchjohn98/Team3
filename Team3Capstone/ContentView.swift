//
//  ContentView.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/19/21.
//

//Need to use Scaled to Fit more often on our app
//Will need to add that modifier to the images currently created 

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            Group{
                //Group for information page
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
                                Text("Get Started!")
                                    .foregroundColor(.black)
                                    .background(Image("squirrelCartoon")
                                                    .resizable()
                                                    .frame(width:200,height:200))
                            })
                    }
                    
                    Spacer()
                        .frame(width: 50.0, height: 100)
                    
                    
                    //HStack at bottom to navigate through each page
                    HStack {
                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                Text(Image(systemName: "house"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                                    
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelInformation(),
                            label: {
                                Text(Image(systemName: "location.circle.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelAboutUs(),
                            label: {
                                Text(Image(systemName: "questionmark.square.fill"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelAboutUs(),
                            label: {
                                Text(Image(systemName: "house"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelAboutUs(),
                            label: {
                                Text(Image(systemName: "person.2.fill"))
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
