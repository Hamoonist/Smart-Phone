//
//  ShortcutData.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import Foundation

struct ShortcutData: ShortcutProtocol, Hashable {
    var id : String {
        get{
            self.name
        }
    }
    let name: String
    let description : String
    let nameOfSymbol : String
    let link: URL
    let color: Double?
    let credit: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: ShortcutData, rhs: ShortcutData) -> Bool {
        lhs.id == rhs.id
    }
    
}
