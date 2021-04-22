//
//  SquirrelInformation.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//

import SwiftUI

struct SquirrelInformation: View {
    var body: some View {
        VStack {
            //Text("Where are the Squirrels?")
            Text("What type of Squirrel do you see?")
            Spacer()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack {
                //Make the backgrounds different colors
                HStack {
                    Text("Eastern Grey Squirrel")
                    Spacer()
                        .frame(width: 175, height: 10)
                }
                HStack {
                Image("squirrelSelectGrey")
                    .resizable()
                    .frame(width:250, height:200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("Grey Backs")
                        Text("White or Grey Bellies")
                        Text("White-Fringed Tails")
                    }
                }
                .background(Color.gray)
            }
            VStack {
                HStack {
                    Text("Eastern Fox Squirrel")
                    Spacer()
                        .frame(width: 175, height: 10)
                }
                HStack {
                Image("squirrelSelectRed")
                    .resizable()
                    .frame(width:250, height:200)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("Orange/Rust back")
                        Text("Orange Bellies")
                        Text("Black-Fringed Tails")
                    }
                }
                .background(Color.orange)
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

struct SquirrelInformation_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelInformation()
    }
}
