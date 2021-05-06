//
//  SquirrelInformation.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//

// Potential new 6 page. Shift this to a page for people to upload their pictures. 7 small windows on page like a gallery, as people start posting pictures. Have a take a photo / upload photo option. All built in. Only allow users to upload.

import SwiftUI
import AppDevWithSwiftLibrary

struct SquirrelUserPictures: View {
    @State private var showCameraPicker = false
    @State private var showPhotoPicker = false
    @State private var image: Image? = nil
    //Need to add this ui image?
    @State private var uiImage : UIImage? = nil
    var body: some View {
        VStack {
                      if image != nil {
                image!.resizable().scaledToFit()
            }
            Button(action: {
                showCameraPicker = true
            }, label: {
                Text("Camera")
            })
            .sheet(isPresented: $showCameraPicker, content: {
                ImagePicker(isShown: $showCameraPicker, image: $image, imagePNG: $uiImage, source: ImagePicker.SourceType.photoLibrary)
            })
            .padding()
        }.onAppear {
            ImagePicker.askPermissionForCamera()
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
