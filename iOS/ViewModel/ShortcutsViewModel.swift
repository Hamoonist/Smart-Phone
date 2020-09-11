//
//  ShortcutsViewModel.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation
import Combine

final class ShortcutsViewModel<Shortcut:ShortcutViewProtocol,
                         Model: ShortcutsModelProtocol >
                            : ObservableObject{
    @Published var shortcuts: [Shortcut] = []
    
    private let model: Model
    private var cancellables: Set<AnyCancellable> = []
    init(){
        self.model = Model()
    }
    /// Gets the updates from the model
    /// And sets it to the `shortcuts` variable
    /// Adds a `AnyCancellable` to the `cancellables` variable
    func subscribeToShortcutsUpdate(){
//        let cancellable = self.model.shortcuts
//            .receive(on: DispatchQueue.main)
//            .sink {
//                //self.shortcuts = $0
//            }
    }
    func covertShortcutProtocolToShortcutViewProtocol(){
        
    }
}
