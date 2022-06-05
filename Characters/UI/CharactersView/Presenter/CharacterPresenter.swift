//
//  CharacterPresenter.swift
//  Characters
//
//  Created by stimLite on 05.06.2022.
//

import Foundation


protocol CharacterViewProtocol: AnyObject {
    func success ()
}

protocol CharacterViewPresenterProtocol{
    func settingView(view: CharacterViewProtocol)
}

class CharacterViewPresenter: CharacterViewPresenterProtocol {
    weak var view: CharacterViewProtocol!
    
    func settingView(view: CharacterViewProtocol) {
        self.view = view
    }
}
