//
//  AboutView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 09. 07..
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        VStack{
            Spacer()
                .frame(width: 100, height: 50
                       , alignment: .center)
            Text("This is a gallery of Siri Shortcuts")
                .font(.title)
                .padding()
            Text("If you have any questions or suggestions, feel free to message me on:").padding()
            
            Button(action: {
                UIApplication.shared.open(URL(string: "https://twitter.com/Hamoonist")!)
            }) {
                Text("Twitter").padding()
            }
            Button(action: {
                UIApplication.shared.open(URL(string: "https://www.instagram.com/hamoonist_ios/")!)
            }) {
                Text("Instagram").padding()
            }
            Spacer()
            VStack{
                Text("App icon and many more made by: ")
                Button(action: {
                    UIApplication.shared.open(URL(string: "http://www.freepik.com")!)
                }) {
                    Text("Freepick.com")
                }
            }.padding()
            }
       
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
