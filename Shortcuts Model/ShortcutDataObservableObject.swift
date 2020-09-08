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

class ShortcutDataObservableObject : ObservableObject {
    
    @Published var shortcuts : [ShortcutData] = []
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
    /// - Bug:
    /// Couldn't get anything from firestore!
    /// - Todo:
    /// Find out why can't anything from the Firestore
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
                        if !self.shortcuts.contains(shortcut){
                            shortcuts.append(shortcut)
                        }
                    }

                }
            }.store(in: &cancellables)
//        shortcutsFSPath.addSnapshotListener { (querry, err) in
//
//        }
    }
    init(){
        self.listenToShortcutUpdates()

    }
    
    private func convertFSDocToShortcut(_ fsdoc: DocumentSnapshot) -> ShortcutData? {
        let name : String = fsdoc.documentID
        guard let data : [String: Any] = fsdoc.data() else {
            print("data is nil")
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
        let credit : String? = data["credit"] as? String
        guard let icondata = data["icon"] as? [String: String] else{
            print("no icondata")
            return nil
        }
        guard icondata["Type"] == "SFSymbol" else {
            print("Icon type is not SFSymbol!")
            return nil
        }
        guard let iconName = icondata["name"] else{
            print("no icon name!")
            return nil
        }
        let colorNumber : Double? = data["color"] as? Double
        print(colorNumber)
        let shortcut = ShortcutData(name: name,
                                    description: description,
                                    nameOfSymbol: iconName,
                                    link: url,
                                    color: colorNumber ?? Double.random(in: 0...1),
                                    credit: credit)
        return shortcut
    }
    
}
