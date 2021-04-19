//
//  ContentView.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/19/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
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
                Text("Get Started!")
                    .background(Image("squirrelCartoon")
                                    .resizable()
                                    .frame(width:100,height:100))
                Spacer()
                    .frame(width: 50.0, height: 100.0)
            }
            
            NavigationView {
                HStack {
                    Text("Test")
                
                    .toolbar {
                        
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            
                            Button("Item 1") {
                                print("Item 1 clicked")
                            }

                            Button("Item 2") {
                                print("Item 2 clicked!")
                            }
                            Button("Item 3") {
                                print("Item 3 clicked")
                            }
                            Button("Item 4") {
                                print("Item 4 clicked")
                            }
                        }
                    }
                }
            }
            .frame(width:200, height:200)
            
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
