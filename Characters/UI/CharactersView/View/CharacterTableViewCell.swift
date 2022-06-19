//
//  CharacterTableViewCell.swift
//  Characters
//
//  Created by stimLite on 19.06.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    var imageGet: UIImageView = {
        var image = UIImageView()
        image.backgroundColor = .red
        image.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageGet)
        updateImage()
    }
    
    func updateImage () {
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
