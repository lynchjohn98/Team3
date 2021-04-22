//
//  SquirrelSighting.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//  Create a new view for each of the screens

import SwiftUI

struct SquirrelSighting: View {
    var body: some View {
        VStack {
            Text("Where are the Squirrels?")
            Text("What type of Squirrel do you see?")
            Spacer()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack {
                Image("squirrelSelectGrey")
                    .resizable()
                    .frame(width:250, height:200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                VStack {
                    Text("Grey Fox Squirrel")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Grey Backs")
                    Text("White or Grey Bellies")
                    Text("White-Fringed Tails")
                }
            }
            HStack {
                Image("squirrelSelectRed")
                    .resizable()
                    .frame(width:250, height:200)
                    .clipShape(Circle())
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
                .frame(width:50, height: 100)
            //John : check out MapKit auto determining your location
            //After you press your squirrel, have the user okay it.
            //Use only when using app (grant permission to use app)
            HStack {
                Text("Enter!")
            }
        }
    }
}

struct SquirrelSighting_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelSighting()
    }
}
