//
//  Builder.swift
//  Characters
//
//  Created by stimLite on 05.06.2022.
//

import UIKit

//protocol BuilderProtocol {
//    func createCharectersView () -> UIViewController
//}

class Builder {
    func createCharectersView () -> UIViewController {
        let view = CharacterViewController ()
        let presenter = CharacterViewPresenter()
        
        presenter.settingView(view: view)
        view.presenter = presenter
        
        return view
    }
}
