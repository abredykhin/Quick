//
//  NewAccountView.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 8/21/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import SwiftUI

struct NewAccountView: View {
    @State var showingProfile = true
    @State var text = "Password"
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color(red: 61.0/255, green: 64.0/255, blue: 72.0/255),
                         Color(red: 86.0/255, green: 90.0/255, blue: 100.0/255)]),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var buttonGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color(red: 63.0/255, green: 67.0/255, blue: 76.0/255),
                         Color(red: 80.0/255, green: 86.0/255, blue: 98.0/255)]),
            startPoint: .leading,
            endPoint: .trailing)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Rectangle().fill(Color(red: 69.0 / 255, green: 95.0 / 255, blue: 237.0 / 255))
                VStack(alignment: .leading) {
                    
                    Text("Create\nAccount")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 120)
                    
                    TextField("Email", text: $text)
                        .foregroundColor(.white)
                        .accentColor(.red)
                        .padding(.top, 40)
                    
                    TextField("Email", text: $text)
                        .foregroundColor(.white)
                        .accentColor(.red)
                        .padding(.top, 20)
                    
                    HStack(alignment: .center) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        NavigationLink(destination: TestSheet()) {
                            ZStack {
                                Circle()
                                    .fill(buttonGradient)
                                    .frame(width: 60, height: 60, alignment: .center)
                                Image(systemName: "arrow.right")
                                    .imageScale(.medium)
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                    .padding(.top, 120)
                }
                .padding()
                .padding(.leading, 18)
                .padding(.trailing, 18)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TestSheet: View {
    var body: some View {
        VStack {
            Text("What's up")
        }.foregroundColor(.black)
    }
}

#if DEBUG
struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
#endif
