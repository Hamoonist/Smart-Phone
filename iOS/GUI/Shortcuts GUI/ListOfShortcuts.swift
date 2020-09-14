//
//  ListOfShortcuts.swift
//  Smart Phone
//
//  Created by Hamoon Jamshidi Meydandar on 2020. 08. 03..
//

import SwiftUI

struct ListOfShortcuts<ViewModel: ShortcutsViewModelProtocol> : View {
    @StateObject var viewModel : ViewModel = ViewModel()
    
    var list : [ViewModel.Shortcut] {
        self.viewModel.shortcuts
    }
    var body: some View {
        NavigationView{
            List(list){ data in
                NavigationLink(
                    destination: ShortcutDetailView(data: data),
                    label: {
                        ShortcutRowView(data: data)
                            .cornerRadius(10)
                    })

            }.navigationBarTitle("The Shortcuts")
        }.navigationViewStyle(StackNavigationViewStyle())

    }
}






struct ListOfShortCuts_Previews: PreviewProvider {
    static var previews: some View {
        
        ListOfShortcuts(viewModel: TestShortcutViewModel())
    }
}


