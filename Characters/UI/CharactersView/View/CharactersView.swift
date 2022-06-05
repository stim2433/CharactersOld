//
//  CharactersView.swift
//  Characters
//
//  Created by stimLite on 05.06.2022.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var presenter: CharacterViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

extension CharacterViewController: CharacterViewProtocol {
    func success() {
        print ("hi, I'm is live")
    }
}
