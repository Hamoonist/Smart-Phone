//
//  ContentView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import SwiftUI

struct ContentView: View {
    @State var showAbout : Bool = false
    var body: some View {
            VStack{
                ListOfShortcuts<ShortcutsVM>()
                Button(action: {
                    self.showAbout = true
                }, label: {
                    Text("About")
                }).sheet(isPresented: $showAbout, content: {
                    AboutView()
                })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
