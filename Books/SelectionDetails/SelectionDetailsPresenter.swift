//
//  SelectionDetailsPresenter.swift
//  Books
//
//  Created by Георгий Бутров on 30.05.2022.
//

import Foundation

class SelectionDetailsPresenter {
    let view: SelectionDetailsViewController!
    var selection: Selection!
    
    private func creatSelectionDetails(_ selection: Selection) -> Selection {
        return Selection(
            name: selection.name,
            poster: selection.poster,
            books: selection.books
        )
    }
    
    required init(view: SelectionDetailsViewController, selection: Selection) {
        self.view = view
        self.selection = self.creatSelectionDetails(selection)
    }
    
    
    
    func getSelectionDetails() -> Selection {
        return self.selection
    }
}
