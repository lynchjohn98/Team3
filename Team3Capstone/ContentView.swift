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
import AppDevWithSwiftLibrary
import MapKit


//Create our cloud kit with generated UUID Strings. Generated online from this tool https://www.uuidgenerator.net/version1
//Generate a new one each time or have them set?
//Get app loaded onto iPad and iPhone

//UserID does not need to be UUID, it is tied to the appID
//I remade the appID because any of the for loops I created weren't working
let cloud = AppDevWithSwiftCloud(appID: "f84e7b88-abfd-11eb-8529-0242ac130003",
                                 userID: "e57be85c-a9e0-11eb-bcbc-0242ac130002")



//Create testflight, distribute app on test flight, and see how it works
//Will give them the ability to load in test flight app first, in test flight you will see your app, download it and run it on the phone

//Get all apple ids, 

//Create our storage data type
struct NewSquirrelUser: Hashable, Codable {
    var id = UUID()
    var username = String()
    var greySquirrelSightings : Double = 0
    var redSquirrelSightings : Double = 0
    //Make array of squirrel
    var squirrels = [SquirrelLocation]()
}

//Create a storage for our locations for the pins located on the map
struct SquirrelLocation : Hashable, Codable, Identifiable {
    var id = UUID()
    //Store a lat and long, those will be codable.
    //Make a seperate array of annotations (populate when update data from cloud)
    var latitiude = Double()
    var longitude = Double()
}

//Global username
var accountUsername = "User"
//Need a var to check if the user made an account or not
var createdAccount : Bool = false
//Variable to store and track the current users id
var userID : String = ""


struct ContentView: View {
    
   //Variables if the user want's to sign up for their own account
    @State var showUserSignUp = false
    @State var selectedUsername = ""
    
    var body: some View {
        
        NavigationView {
                    
            VStack {
                
                HStack {
                   
                    //Spacer()
                    Button(action: {
                        //This will generate ten random users with arbitrary data.
                        for i in 0..<10 {
                            let randomGrey = Int.random(in: 0..<15)
                            let randomRed = Int.random(in: 0..<15)
                            let randomLat = CGFloat.random(in: 41.865000...42.02871)
                            let randomLong = CGFloat.random(in: 87.635000...87.760000) * -1
                            let lat = String(format: "%.6f", randomLat)
                            let long = String(format: "%.6f", randomLong)
                            let randomSighting : SquirrelLocation = SquirrelLocation(latitiude: Double(lat)!, longitude: Double(long)!)
                            cloud.save(data: NewSquirrelUser(username: "Tester " + String(i), greySquirrelSightings : Double(randomGrey), redSquirrelSightings: Double(randomRed), squirrels: [randomSighting]))
                            //Empty array of squirrel locations
                        }
                    },
                           label: {
                            Text(Image(systemName: "person.3"))
                    })
                    //Spacer()
                    
                    //I want this button to clear all data that I currently have populated. I am trying to use delete by ID but not sure if it works
                    Button(action: {
                        cloud.getAll(dummy: NewSquirrelUser()) {
                            (people) in
                            for person in people {
                                cloud.deleteByID(dummy: NewSquirrelUser(), id: person.id.uuidString)
                            }
                        }
                    }, label: {
                        Text(Image(systemName: "trash.fill"))
                    })
                   
                }
                .frame(width:80, height:25)
                        VStack {
                            //Doesn't need to be own vstack
                            //
                            Image("SquirrelsTopImagePage")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                //.frame(width: 600, height:100)
                        }
                        
                        VStack {
                            Image("titlePageSquirrel")
                                .resizable()
                                .scaledToFit()
                                //.frame(width:350,height:)
                            
                            NavigationLink(
                                destination: SquirrelSighting(),
                                label: {
                                    Image("AcornTitlePageFinal")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:225,height:110)
                                })
                        }
                    
  
                    //HStack at bottom to navigate through each page
                    //Link the sighting to the trophy. After someone puts in a squirrel it will link to a trophy case
                    VStack {
                        HStack {
                            Button(action: {
                                showUserSignUp = true
                            }, label: {
                                Text(Image(systemName: "person.badge.plus"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .sheet(isPresented: $showUserSignUp) {
                                Text("Please enter your username")
                                    .multilineTextAlignment(.center)
                                TextField("Enter your username", text: $selectedUsername)
                                Button(action: {
                                    cloud.save(data: NewSquirrelUser(username: selectedUsername, greySquirrelSightings : 0, redSquirrelSightings : 0, squirrels : []))
                                    accountUsername = selectedUsername
                                    createdAccount = true
                                    showUserSignUp = false
                                    
                                }, label: {
                                    Text("Submit")
                                })
                            }
                            .multilineTextAlignment(.center)
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
                                Image("squirrelAccountPage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    //.font(.system(size: 30))
                                    //.foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelAboutUs(),
                            label: {
                                Text(Image(systemName: "book"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        NavigationLink(
                            destination: SquirrelUserPictures(),
                            label: {
                                Text(Image(systemName: "camera"))
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            })
                            .frame(width:60)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ).navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//Logic for buttons at top
/*
 Button(action: {
     showUserSignUp = true
 }, label: {
     Text(Image(systemName: "person.badge.plus"))
 })
 .sheet(isPresented: $showUserSignUp) {
     Text("Please enter your username")
         .multilineTextAlignment(.center)
     TextField("Enter your username", text: $selectedUsername)
     Button(action: {
         cloud.save(data: NewSquirrelUser(username: selectedUsername, greySquirrelSightings : 0, redSquirrelSightings : 0, squirrels : []))
         accountUsername = selectedUsername
         createdAccount = true
         showUserSignUp = false
         
     }, label: {
         Text("Submit")
     })
 }
 .multilineTextAlignment(.center)
 
 */
