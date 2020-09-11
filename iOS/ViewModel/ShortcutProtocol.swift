//
//  ShortcutsProtocol.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation

protocol ShortcutProtocol : Identifiable {
    var id: String { get }
    var name: String { get }
    var description : String { get }
    var link : URL { get }
    var nameOfSymbol : String { get }
    var color: Double? { get }
    var credit: String? { get }

}


protocol ShortcutViewProtocol : Identifiable{
    var id: String { get }
    var name: String { get }
    var description : String { get }
    var link : URL { get }
    var nameOfSymbol : String { get }
    var color: Double? { get }
    var credit: String? { get }
    static func makeFrom<T: ShortcutProtocol>(_ shotcutData: T)
}

