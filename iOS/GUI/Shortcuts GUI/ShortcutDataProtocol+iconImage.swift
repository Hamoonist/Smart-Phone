//
//  ShortcutDataProtocol+iconImage.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 09. 12..
//

import Foundation
import SwiftUI


extension ShortcutDataProtocol {
    func iconImage() -> Image? {
        switch self.icon {
            case .SFSymbol(let sfsymbol):
                return Image(systemName: sfsymbol)
            case .localIcon(let local):
                return Image(local)
            @unknown default:
                return nil
        }
    }
}



struct ShortcutDataProtocoliconImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        AListOfShortcutData[0].iconImage()
        AListOfShortcutData[1].iconImage()

        }
    }
}
