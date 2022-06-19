//
//  CharacterPresenter.swift
//  Characters
//
//  Created by stimLite on 05.06.2022.
//

import Foundation


protocol CharacterViewProtocol: AnyObject {
    func success ()
    func load()
}

protocol CharacterViewPresenterProtocol{
    func settingView(view: CharacterViewProtocol, network: ServiceNetwork<Endpoint>)
//    func getImage (stingImage: String?)
//    var getImage: Data? { get }
    var model: CharacterModel? { get }
    var imageData: Data? { get }
}

extension CharacterViewPresenterProtocol {
    
}

class CharacterViewPresenter: CharacterViewPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var network: ServiceNetwork<Endpoint>!
    var model: CharacterModel?
    var imageData: Data?
    
    
    func settingView(view: CharacterViewProtocol, network: ServiceNetwork<Endpoint>) {
        self.view = view
        self.network = network
        
        getData()
    }
    
    func loaded() {
        print ("hi is nil")
    }
    
    private func getData () {
        network.load(service: .character, dataType: CharacterModel?.self) { [weak self] result in
            guard let self = self else { return }
    
            switch result {
            case .success(let character):
                self.model = character
                self.view?.success()
            case .failure(let error):
                print (error.localizedDescription)
            }
        }
    }
    
    func getImage (stingImage: String?) {
        guard let stingImage = stingImage else { return }

        network.load(stringUrl: stingImage) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let image):
                self.imageData = image
                print (self.imageData)
            case .failure(let error):
                print (error)
            }
        }
    }
}
