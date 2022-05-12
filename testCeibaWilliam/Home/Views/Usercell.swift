//
//  Usercell.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import UIKit

class UserCell: UITableViewCell {

    let imageBack: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        img.layer.borderWidth = 1
        img.layer.borderColor = UIColor.lightGray.cgColor
        img.layer.cornerRadius = 9
        return img
    }()

    let lblName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.gray
        return lbl
    }()

    let imgPhone: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "phone")
        return img
    }()

    let imgEmail: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "mail")
        return img
    }()

    let lblPhone: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()

    let lblEmail: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textAlignment = .left
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()

    let btnPublications: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        btn.setTitle("SHOW POSTS >", for: .normal)
        btn.titleLabel?.textAlignment = .right
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        btn.setTitleColor(UIColor.systemBlue , for: .normal)
        return btn
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(imageBack)
        imageBack.topAnchor.constraint(equalTo: topAnchor, constant: 13).isActive = true
        imageBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 14).isActive = true
        imageBack.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        imageBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -13).isActive = true

        contentView.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        lblName.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        lblName.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 37).isActive = true

        contentView.addSubview(imgPhone)
        imgPhone.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        imgPhone.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 1).isActive = true
        imgPhone.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgPhone.widthAnchor.constraint(equalToConstant: 20).isActive = true

        contentView.addSubview(imgEmail)
        imgEmail.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        imgEmail.topAnchor.constraint(equalTo: imgPhone.bottomAnchor, constant: 6).isActive = true
        imgEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgEmail.widthAnchor.constraint(equalToConstant: 20).isActive = true

        contentView.addSubview(lblPhone)
        lblPhone.leftAnchor.constraint(equalTo: imgPhone.rightAnchor, constant: 6).isActive = true
        lblPhone.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 1).isActive = true
        lblPhone.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblPhone.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

        contentView.addSubview(lblEmail)
        lblEmail.leftAnchor.constraint(equalTo: imgEmail.rightAnchor, constant: 6).isActive = true
        lblEmail.topAnchor.constraint(equalTo: lblPhone.bottomAnchor, constant: 6).isActive = true
        lblEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
        lblEmail.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true

        contentView.addSubview(btnPublications)
        btnPublications.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        btnPublications.rightAnchor.constraint(equalTo: rightAnchor, constant: -35).isActive = true
        btnPublications.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
