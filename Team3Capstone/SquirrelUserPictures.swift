//
//  SquirrelInformation.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//

// Potential new 6 page. Shift this to a page for people to upload their pictures. 7 small windows on page like a gallery, as people start posting pictures. Have a take a photo / upload photo option. All built in. Only allow users to upload.

import SwiftUI

struct SquirrelInformation: View {
    var body: some View {
        VStack {
            
            Spacer()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack {
                //Make the backgrounds different colors
                HStack {
                    Text("Eastern Grey Squirrel")
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
        }
    }
}

struct SquirrelInformation_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelInformation()
    }
}
