//
//  ShortcutData.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import Foundation

struct ShortcutData: ShortcutDataProtocol, Hashable {
    init(id: String, name: String, description: String, link: URL, icon: ShortcutIcon, color: Double?, credit: String?) {
        self.id = id
        self.name  = name
        self.description = description
        self.icon = icon
        self.link = link
        self.color = color
        self.credit = credit
    }
    
    let id : String
    let name: String
    let description : String
    let icon : ShortcutIcon
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
