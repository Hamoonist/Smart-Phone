//
//  ContentView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    ListOfShortcuts(list: [
        
            ShortcutData.init(name: "Notification",
                  description: "This notification will notify you about some good stuffs!",
                  nameOfSymbol: "bell.circle.fill",
                  link: URL(string: "www.apple.com")!,
                  color: 0.2),
           
            ShortcutData.init(name: "Map",
                  description: "This is an automation for showing your current position on the maps. \n It opens the maps and shows where you are! magic!",
                  nameOfSymbol: "map",
                  link: URL(string: "www.apple.com")!,
                  color: 0.8)
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
