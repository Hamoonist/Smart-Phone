//
//  ShortcutDataObservableObject.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 18..
//

import Foundation
import Combine
import FirebaseFirestore
import CombineFirebaseFirestore

class ShortcutsDataObservableObject<Shortcut: ShortcutDataProtocol> : ShortcutsModelProtocol , ObservableObject {
   
    @Published var shortcuts: [Shortcut] = []
    var shortuctsPublished: Published<[Shortcut]> { _shortcuts }
    var shortcutsPublisher: Published<[Shortcut]>.Publisher { $shortcuts }
    
   
    private var cancellables : Set<AnyCancellable> = []
    var timer: Timer?
    private let db = Firestore.firestore()
    private var shortcutsFSPath : CollectionReference {
        db
        .collection("Smart Phone")
        .document("V1")
        .collection("Shortcuts")

    }
    /// Attaches a listener to Firestore for live updates.

    func listenToShortcutUpdates(){
        shortcutsFSPath
            .publisher()
            .sink { (completion) in
                switch completion{
                    case .failure(let error):
                        print("error in getting shortcuts from firebsase")
                        print(error)
                    case .finished:
                        print("getting data from firestore finished")
                }
            } receiveValue: { [self] (docdata) in
                for doc in docdata.documents {
                    print(doc.documentID)
                    print(doc.data())
                    if let shortcut = self.convertFSDocToShortcut(doc){
                        //TODO
                        if !self.shortcuts.contains(shortcut){
                            shortcuts.append(shortcut)
                        }
                    }

                }
            }.store(in: &cancellables)
        
    }
    required init(){
        self.listenToShortcutUpdates()

    }
    
    private func convertFSDocToShortcut(_ fsdoc: DocumentSnapshot) -> Shortcut? {
        let id : String = fsdoc.documentID
    
        guard let data : [String: Any] = fsdoc.data() else {
            print("data is nil")
            return nil
        }
        
        guard let name = data["Name"] as? String else {
            print("name is nil")
            return nil
        }
        guard let urlString = data["URL"] as? String else {
            print("urlstring is nil")
            return nil
        }
        guard let url = URL(string: urlString) else{
            print("url is nil")
            return nil
        }
        guard let description = data["Description"] as? String else{
            print("description is nil")
            return nil
        }
        let credit : String? = data["Credit"] as? String
        guard let icondata = data["Icon"] as? [String: Any] else{
            print("no icondata")
            return nil
        }
        guard let iconType = icondata["Type"] as? String else {
            print("No icon!")
            return nil
        }
        guard let iconName = icondata["Name"] as? String else{
            print("no icon name!")
            return nil
        }
        let icon : ShortcutIcon? = {
            switch iconType {
                case "SFSymbol":
                    return .SFSymbol(iconName)
                case "Local":
                    return .localIcon(iconName)
                default:
                    return nil
            }
        }()
        guard icon != nil else {
            print("Couldn't convert the icon!")
            return nil
        }
        let colorNumber : Double? = data["Colour"] as? Double
        if colorNumber == nil { print("no colour") }
        let shortcut = Shortcut(id: id,
                                name: name,
                                    description: description,
                                    link: url,
                                    icon: icon!,
                                    color: colorNumber ?? Double.random(in: 0...1),
                                    credit: credit)
        print("got a shortcut!")
        return shortcut
    }
    
}
