//
//  ShortcutDetailView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 04..
//

import SwiftUI

struct ShortcutDetailView<Shortcut: ShortcutDataProtocol>: View {
    @Environment(\.colorScheme) var colorScheme

    let data: Shortcut

    var body: some View {
        ZStack{
            Color(hue: data.color ?? 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.4)
                .cornerRadius(30)
        VStack{
            HStack{
                data.iconImage()?
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
                UIApplication.shared.open(data.link)

            }) {
                Text("Get the Shortcut").padding()
                    .accentColor(.white)
                    .background(Color.init(hue:data.color ?? 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.4))
                    .cornerRadius(5)
            }.padding()
            
            if (data.credit != nil){
                Text("Credit to: \(data.credit!)")
                    .font(.footnote)
                    .frame(minWidth: 200,  minHeight: 50,  alignment: .center)
                    .padding()
                
            }

        }
            
        }
        .padding(10)
        .navigationBarTitle("Shortcut detail")
    }
}

struct ShortcutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ShortcutDetailView(data: ShortcutData.init(id: UUID().uuidString, name: "Notification",
           description: "This notification will notify you about some good stuffs!",
           link: URL(string: "www.apple.com")!, icon: .localIcon("161-alarm"),
           color: 0.5, credit: "Good People"))
            ShortcutDetailView(data: ShortcutData.init(id: UUID().uuidString, name: "Map",
                  description: "This is an automation for showing your current position on the maps. \n It opens the maps and shows where you are! magic!",
                  link: URL(string: "www.apple.com")!, icon: .SFSymbol("map"),
                  color: 0.8, credit: nil))
            ShortcutDetailView(data: ShortcutData.init(id: UUID().uuidString, name: "Map",
                  description: "This is an automation for showing your current position on the maps. \n It opens the maps and shows where you are! magic!",
                  link: URL(string: "www.apple.com")!, icon: .localIcon("146-download"),
                  color: 0.3, credit: nil))
            
        }
    }
}
