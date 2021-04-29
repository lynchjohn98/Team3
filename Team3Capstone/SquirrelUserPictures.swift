//
//  SquirrelInformation.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//

// Potential new 6 page. Shift this to a page for people to upload their pictures. 7 small windows on page like a gallery, as people start posting pictures. Have a take a photo / upload photo option. All built in. Only allow users to upload.

import SwiftUI

struct SquirrelUserPictures: View {
    @State var image : Image?
    @State var showPicker = false
    
    var body: some View {
        
        VStack {
            Text("Upload some photos!")
            Button(action: {
                showPicker = true
            }, label: {
                Text("Choose Camera")
            })
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
}

struct SquirrelUserPictures_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelUserPictures()
    }
}
