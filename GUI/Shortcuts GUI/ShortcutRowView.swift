//
//  ShortcutRowView.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import SwiftUI

struct ShortcutRowView: View {
  
    let data : ShortcutData
    var body: some View {
        ZStack{
            //Color.black
            
            Color.init(hue: data.color ?? 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.4)
                
            HStack{
                VStack{
                    Image(systemName: data.nameOfSymbol).resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding()
                Spacer()
                }
            VStack {
                HStack {
                    Text(data.name)
                        .font(.title)
                        .padding()
                    Spacer()
                }
                HStack {
                    Text(data.description)
                        .frame(minWidth: 200,  minHeight: 50,  alignment: .leading)
                        .padding()
                    Spacer()
                }
            }
        }
        }
    }
}


struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ShortcutRowView(data:
                            .init(name: "Notification",
                                  description: "This notification will notify you about some good stuffs",
                                  nameOfSymbol: "bell.circle.fill",
                                  link: URL(string: "www.apple.com")!,
                                  color: 0.2))
           /* ShortcutView(image: Image(systemName: "bell.circle.fill"),color: Color.init(hue: 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.2),
                         name: "A shortcut", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .frame(width: 300, height: 200 , alignment: .center)
            ShortcutView(image: Image(systemName: "bell.circle.fill"),color: Color.init(hue: 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.2),
                         name: "A shortcut", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                .previewLayout(.fixed( width: 400, height: 300))
               
            ShortcutView(image: Image(systemName: "bell.circle.fill"),color: Color.init(hue: 0.2, saturation: 0.5, brightness: 0.5, opacity: 0.2),
                         name: "A shortcut", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.").colorScheme(.dark)*/
        }
        
    }
}
