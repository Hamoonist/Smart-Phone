//
//  ShortcutData.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import Foundation

struct ShortcutData: Identifiable {
    let id : UUID = UUID()
    let name: String
    let description : String
    let nameOfSymbol : String
    let link: URL
    let color: Double?
}
