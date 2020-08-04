//
//  ShortcutDetailView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 04..
//

import SwiftUI

struct ShortcutDetailView: View {
    @Environment(\.colorScheme) var colorScheme

    let data: ShortcutData
    var body: some View {
        ZStack{
            Color(hue: data.color ?? 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.4)
                .cornerRadius(30)
        VStack{
            HStack{
            Image(systemName: data.nameOfSymbol)
                .resizable().scaledToFit()
                .padding()
                .frame(width: 100, height: 100, alignment: .center)
                Text(data.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
        }
            Text(data.description)
                .font(.title2)
                .padding()
            Button(action: {
                
            }) {
                Text("Get the Shortcut").padding()
                    .accentColor(.white)
                    .background(Color.init(hue:data.color ?? 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.4))
                    .cornerRadius(5)
            }.padding()
        }
            
        }
        .padding(10)
        .navigationBarTitle("Shortcut detail")
    }
}

struct ShortcutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        ShortcutDetailView(data: ShortcutData.init(name: "Notification",
           description: "This notification will notify you about some good stuffs!",
           nameOfSymbol: "bell.circle.fill",
           link: URL(string: "www.apple.com")!,
           color: 0.5))
            ShortcutDetailView(data: ShortcutData.init(name: "Map",
                  description: "This is an automation for showing your current position on the maps. \n It opens the maps and shows where you are! magic!",
                  nameOfSymbol: "map",
                  link: URL(string: "www.apple.com")!,
                  color: 0.8))
            
        }
    }
}
