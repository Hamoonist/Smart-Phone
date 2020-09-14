//
//  ShortcutsViewModelProtocol.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 09. 11..
//

import Foundation


protocol ShortcutsViewModelProtocol : Initialisable, ObservableObject {
    associatedtype Shortcut: ShortcutDataProtocol
    var shortcuts : [Shortcut] { get }
    var shortuctsPublished : Published<[Shortcut]> { get }
    var shortcutsPublisher : Published<[Shortcut]>.Publisher { get }
}
