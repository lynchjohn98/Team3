//
//  SquirrelSighting.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//  Create a new view for each of the screens

import SwiftUI
import AppDevWithSwiftLibrary
import Foundation

struct SquirrelSighting: View {

    //Simple binary representation 0 is for grey, 1 is for red
    @State var squirrelSelection : Int = -1
    @State var greySquirrelSelected : Bool = false
    @State var redSquirrelSelected : Bool = false
    

    var body: some View {
          
        NavigationView {
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
                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Enter")
                        .bold()
                        .fontWeight(.heavy)
                })
            }
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            )
        }
        
    }

    }


struct SquirrelSighting_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelSighting()
    }
}



