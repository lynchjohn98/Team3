//
//  SquirrelData.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/22/21.
//

import SwiftUI
import AppDevWithSwiftLibrary
import MapKit

struct SquirrelData: View {
    
    var body: some View {
    
        TabView {
            SquirrelDataCharts()
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
    }
}

//Struct for pie chart data view
struct SquirrelDataCharts : View {
    
    @State var amountOfUsers : Int = 0
    @State var allGreySquirrelSightings : Double = 0
    @State var allRedSquirrelSightings : Double = 0
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                Text("There are a total of " + String(amountOfUsers) + " users")
            }
            
            VStack {
                Spacer()
                Text("Global findings : All Users Grey and Red Squirrel Findings")
                HStack {
                    Text(String(allGreySquirrelSightings))
                        .foregroundColor(.gray)
                    Text(" VS ")
                    Text(String(allRedSquirrelSightings))
                        .foregroundColor(.red)
                }
                PieChartView(slices: [allGreySquirrelSightings, 50.0, allRedSquirrelSightings], colors: [Color.gray, Color.orange, Color.red])
                
                Spacer()
                Text("Your findings : Grey and Red Squirrel")
                if (createdAccount == false) {
                    Text("Please make an account to start finding squirrels!")
                }
                else {
                    
                }
                
                Spacer()
                
                
                
            }
            
            VStack {
                
            }
            Text("Total Findings!")
        }
        //As our data view appears, need to fill in our information
        .onAppear(perform: {
            //A constant that will keep all of our data stored.
            cloud.getAll(dummy: NewSquirrelUser()) { (people) in
                for person in people {
                    amountOfUsers += 1
                    allGreySquirrelSightings += person.greySquirrelSightings
                    allRedSquirrelSightings += person.redSquirrelSightings
                    
                }
                print(amountOfUsers)
            }
            print("This has finished parsing")

        })
    }
}

//Struct for map with annotations data view
struct SquirrelDataMap : View {
    //Annotated map provided in cloud snippet
    @State private var region =
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.325),
                           span: MKCoordinateSpan(latitudeDelta: 0.12, longitudeDelta: 0.12))
    
    
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct SquirrelData_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelData()
    }
}
