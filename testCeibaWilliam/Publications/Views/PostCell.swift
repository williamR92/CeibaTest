//
//  PostCell.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import UIKit

class PostCell: UITableViewCell {

    //MARK: - UI Components
    
    let imageBack: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.lightGray.cgColor
        img.layer.cornerRadius = 9
        return img
    }()


    let lblTile: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(imageBack)
        imageBack.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        imageBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        imageBack.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        imageBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42).isActive = true

        contentView.addSubview(lblTile)
        lblTile.topAnchor.constraint(equalTo: imageBack.topAnchor, constant: 0).isActive = true
        lblTile.leftAnchor.constraint(equalTo: imageBack.leftAnchor, constant: 30).isActive = true
        lblTile.rightAnchor.constraint(equalTo: imageBack.rightAnchor, constant: -13).isActive = true
        lblTile.bottomAnchor.constraint(equalTo: imageBack.bottomAnchor, constant: 0).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


