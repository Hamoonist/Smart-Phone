//
//  ShortcutsModelProtocol.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation
import Combine

protocol ShortcutsModelProtocol {
    associatedtype Shortcut : ShortcutProtocol

    var shortcuts : AnyPublisher<[Shortcut], Never> { get }
    init()
}
