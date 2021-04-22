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
                Text("Grey Fox Squirrel")
            }
            HStack {
                Image("squirrelSelectRed")
                    .resizable()
                    .frame(width:250, height:200)
                    .clipShape(Circle())
                Text("Red Fox Squirrel")
            }
            Spacer()
                .frame(width:50, height: 100)
            HStack {
                Text("Get Started!")
                    .background(Image("squirrelCartoon")
                                    .resizable()
                                    .frame(width:200,height:200))
            }
        }
    }
}

struct SquirrelSighting_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelSighting()
    }
}
