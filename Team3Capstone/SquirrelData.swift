//
//  SquirrelData.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/22/21.
//

import SwiftUI
import AppDevWithSwiftLibrary
import MapKit

//This is a boolean that is used to avoid the onAppear function from firing again
var hasCalculated : Bool = false

struct SquirrelData: View {
    
    @State var amountOfUsers : Int = 0
    @State var allGreySquirrelSightings = 0
    @State var allRedSquirrelSightings  = 0
    @State var currentUserGraySightings = 0
    @State var currentUserRedSightings = 0
    
    var body: some View {
    
        TabView {
            VStack{
                VStack {
                    Text("There are a total of " + String(amountOfUsers) + " users")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                    Spacer()
                        .frame(width:50, height: 50)
                }
                VStack {
                    
                    Text("All Users Grey vs. Red Squirrel Findings")
                        .multilineTextAlignment(.center)
                    HStack {
                        Text(String(allGreySquirrelSightings))
                            .foregroundColor(.gray)
                        Text(" VS ")
                        Text(String(allRedSquirrelSightings))
                            .foregroundColor(.red)
                    }
                    
                    VStack {
                        PieChartView(slices: [Double(allGreySquirrelSightings), Double(allRedSquirrelSightings)], colors: [Color.gray, Color.red])
                            .frame(width:150, height:150)
                    }
                    Spacer()
                        .frame(width: 50, height: 50)
                    Text("Your Grey vs. Red Squirrel Findings")
                    if (createdAccount == false) {
                        Text("Please make an account to start finding squirrels!")
                            .foregroundColor(.red)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                    else {
                        HStack {
                            Text(String(currentUserGraySightings))
                                .foregroundColor(.gray)
                            Text(" VS ")
                            Text(String(currentUserRedSightings))
                                .foregroundColor(.red)
                        }
                        PieChartView(slices: [Double(currentUserGraySightings), Double(currentUserRedSightings)], colors: [Color.gray, Color.red])
                            .frame(width:150, height:150)
                    }
                }
            }
                .padding()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Pie Charts")
                }
                .tag(1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
            SquirrelDataMap()
                .padding()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Maps")
                }
                .tag(2)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
        }
        //As our data view appears, need to fill in our information
        //need to fix this between the tabs
        .onAppear(perform: {
      
            //A constant that will keep all of our data stored.
            cloud.getAll(dummy: NewSquirrelUser()) { (people) in
                for person in people {
                    amountOfUsers += 1
                    allGreySquirrelSightings += Int(person.greySquirrelSightings)
                    allRedSquirrelSightings += Int(person.redSquirrelSightings)
                    if person.username == accountUsername {
                        currentUserGraySightings += Int(person.greySquirrelSightings)
                        currentUserRedSightings += Int(person.redSquirrelSightings)
                    }
                }
            
            }
        })
    }
}

//Struct for map with annotations data view
struct SquirrelDataMap : View {
    //Current user
    @State var currentUser = NewSquirrelUser()
    //Current users sightings
    @State var currentUserLocations : [SquirrelLocation] = []

    //Coordinate var for the map pin
    @State var coordinate = CLLocationCoordinate2D()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.789722, longitude: -87.599724),
        span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: currentUserLocations) {  (location) -> MapPin in
                MapPin(coordinate: CLLocationCoordinate2D(latitude: 41.789722, longitude: -87.599724))
            }
        }
        .onAppear(perform:  {
            print("Starting on perform")
            cloud.getAll(dummy: NewSquirrelUser()) {
                (people) in
                for person in people {
                    if person.username == accountUsername {
                        currentUser = person
                        for sighting in currentUser.squirrels {
                            coordinate.latitude = sighting.latitiude
                            coordinate.longitude = sighting.longitude
                            
                        }
                    }
                }
            }
        })
    }
}

struct SquirrelData_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelData()
    }
}
