//
//  ContentView.swift
//  roombee
//
//  Created by Adwait Ganguly on 10/7/23.
//

import SwiftUI

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

struct ContentView: View {
    @State private var imageOpacity: Double = 0.0
    var ourPurple = hexStringToUIColor(hex: "#381e38")
    var body: some View {
        NavigationView {
            NavigationLink {
                SignUp()
            } label: {
                ZStack{
                    Color(ourPurple).ignoresSafeArea()
                    
                    VStack {
                        Image("Roombee")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .opacity(imageOpacity)
                            .offset(x: 10)
                            .onAppear() {
                                withAnimation(Animation.easeIn(duration: 2.0)) {
                                    imageOpacity = 1.0
                                }
                                
                            }
                            .padding()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
