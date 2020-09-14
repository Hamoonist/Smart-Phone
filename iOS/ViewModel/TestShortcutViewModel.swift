//
//  TestShortcutViewModel.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 09. 13..
//

import Foundation

final class TestShortcutViewModel : ObservableObject, ShortcutsViewModelProtocol {
    var shortuctsPublished: Published<[ShortcutData]> {_shortcuts}
    
    var shortcutsPublisher: Published<[ShortcutData]>.Publisher { $shortcuts}
    
    typealias Shortcut = ShortcutData
    @Published var shortcuts: [Shortcut] = []
    //private var cancellables: Set<AnyCancellable> = []
    
    init(){
        self.shortcuts.append(AListOfShortcutData[0])
        self.shortcuts.append(AListOfShortcutData[1])

    }

}
