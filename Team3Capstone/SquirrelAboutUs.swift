//
//  SquirrelAboutUs.swift
//  Team3Capstone
//
//  Created by John William Lynch on 4/21/21.
//
import UIKit
import SwiftUI

struct SquirrelAboutUs: View {
    
    
    //Helper function to help with image scrolling
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x - 32)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    
    //Index for paging views
    //Images for the steppers on the squirrel info tabs
    var greySquirrelImages = [ "grey6", "grey7", "grey5", "grey9", "grey3", "grey10"]
    var redSquirrelImages = ["redSquirrelSelect", "red1", "red2", "red3", "red4", "red5"]
    
    var body: some View {
        
            TabView {
                
                //About the App Tab
                VStack {
                    Image("SquirrelInfo")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Text("Squirrels are native to North America and other parts of the world.  They are very active animals so they are easily seen throughout the day.  Squirrels are an important indicator to our local environments because they live in a small territory and are active year round.  They need various resources that are also important to  other urban wildlife in the area. Their population numbers change and this affects other urban wildlife in the neighborhoods.  These population changes will affect prey and predators equilibrium and the environmental conditions of the wildlife in an urban area. The squirrel’s tail is a stabilizer for when they go airborne  between trees and branches. These two types of squirrels may cross paths but don’t necessarily live in the same areas. Their predators are hawks, foxes, coyotes  and house cats.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    Spacer()
                    
                }
                .padding()
                .tabItem {
                    Image(systemName: "book.circle")
                    Text("About the App")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
                //Code for stepper image carasoul based off of this link:
                //https://www.letsbuildthatapp.com/course_video?id=7102
                VStack {
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 50) {
                                ForEach(0..<redSquirrelImages.count-1) { num in
                                    GeometryReader { proxy in
                                        NavigationLink(
                                            destination: Image(String(redSquirrelImages[num])),
                                            label: {
                                                VStack {
                                                    let scale = getScale(proxy: proxy)
                                                    Image(String(redSquirrelImages[num]))
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 150)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                        )
                                                        .clipped()
                                                        .cornerRadius(5)
                                                        .shadow(radius: 5)
                                                        .scaleEffect(CGSize(width: scale, height: scale))
                                                        .animation(.easeOut(duration: 0.5))
                                                }
                                            })
                                    }
                                    .frame(width: 125, height: 300)
                                        
                                }
                            }.padding(32)
                        }
                        }
                        
                    Text("Red Fox squirrels spend most of their time on the ground searching for food and they prefer to be in an area that is next to Woodlands. Red Fox squirrels are active through the day and sleep at night. Their predators are hawks, foxes, coyotes  and house cats.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }.padding()
                .tabItem{
                    Image(systemName: "r.circle")
                    Text("Red Fox Squirrels")
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
                
                //Gray Squirrel Info Tab
                VStack {
                    VStack {
                        ScrollView(.horizontal) {
                            HStack(spacing: 50) {
                                ForEach(0..<greySquirrelImages.count-1) { num in
                                    GeometryReader { proxy in
                                        NavigationLink(
                                            destination: Image(String(greySquirrelImages[num])),
                                            label: {
                                                VStack {
                                                    let scale = getScale(proxy: proxy)
                                                    Image(String(greySquirrelImages[num]))
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 150)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.5)
                                                        )
                                                        .clipped()
                                                        .cornerRadius(5)
                                                        .shadow(radius: 5)
                                                        .scaleEffect(CGSize(width: scale, height: scale))
                                                        .animation(.easeOut(duration: 0.5))
                                                }
                                            })
                                    }
                                    .frame(width: 125, height: 300)
                                        
                                }
                            }.padding(32)
                        }
                        }
                    Text("Gray squirrels prefer areas with a dense tree population. Gray squirrels are most active early in the morning and late afternoon. Their predators are hawks, foxes, coyotes  and house cats.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding()
                .tabItem{
                    Image(systemName: "g.circle")
                    Text("Gray Fox Squirrels")
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RadialGradient(gradient: Gradient(colors: [.white, .orange]), center: .center, startRadius: 2, endRadius: 650)
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                )
            }
            }
    }
struct SquirrelAboutUs_Previews: PreviewProvider {
    static var previews: some View {
        SquirrelAboutUs()
    }

}

