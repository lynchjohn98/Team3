//
//  SquirrelData.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/22/21.
//

import SwiftUI
import AppDevWithSwiftLibrary

struct SquirrelData: View {

    var body: some View {
        
        
        VStack{

        Spacer()
            
        VStack {
            Text("This is the graphs pages for maps and data")
            }
            
        VStack {
            let totalAmountOfGreySquirrels : Int = 40
            let totalAmountOfRedSquirrels : Int = 50
            
            Text("Your Findings!")
            Spacer()
            PieChartView(slices: [40, 50], colors: [Color.gray, Color.red])
                .frame(width: 200, height: 200)
            Spacer()
            }
            Text("Total Findings!")
            
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        )
    }
}
 

struct SquirrelData_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelData()
    }
}
