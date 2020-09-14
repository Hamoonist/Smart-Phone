//
//  ShortcutsViewModel.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 20..
//

import Foundation
import Combine

final class ShortcutsViewModel< Model: ShortcutsModelProtocol >
                            : ShortcutsViewModelProtocol, ObservableObject{
    @Published var shortcuts: [Model.Shortcut] = []
    var shortuctsPublished : Published<[Model.Shortcut]> { _shortcuts }
    var shortcutsPublisher : Published<[Model.Shortcut]>.Publisher { $shortcuts }
    private let model: Model
    private var cancellables: Set<AnyCancellable> = []
    init(){
        self.model = Model()
        self.subscribeToShortcutsUpdate()
    }
    
    
    /// Gets the updates from the model
    /// And sets it to the `shortcuts` variable
    /// Adds a `AnyCancellable` to the `cancellables` variable
    func subscribeToShortcutsUpdate(){
        let cancellable = self.model.shortcutsPublisher
            .receive(on: DispatchQueue.main)
            .sink {
                self.shortcuts = $0
            }
        self.cancellables.insert(cancellable)
    }
   
}
