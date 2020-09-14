//
//  ShortcutsProtocol.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation

protocol ShortcutDataProtocol : Identifiable, Equatable{
    var id: String { get }
    var name: String { get }
    var description : String { get }
    var link : URL { get }
    var icon : ShortcutIcon { get }
    var color: Double? { get }
    var credit: String? { get }
    init(id: String,
         name: String,
         description : String,
         link : URL ,
         icon : ShortcutIcon  ,
         color: Double?,
        credit: String?)
}


