//
//  ShortcutsModelProtocol.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation
import Combine



protocol ShortcutsModelProtocol: Initialisable {
    associatedtype Shortcut : ShortcutDataProtocol
    var shortcuts : [Shortcut] { get }
    var shortuctsPublished : Published<[Shortcut]> { get }
    var shortcutsPublisher : Published<[Shortcut]>.Publisher { get }
}
