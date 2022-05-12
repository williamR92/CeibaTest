//
//  PublicationsViewController.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 11/5/22.
//

import UIKit

class PostsViewController: UIViewController {

    //MARK: - UI Components
    lazy var tblPosts: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .none
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        return tbv
    }()

    //MARK: - Properties
    var idUser = 0
    var viewModel = PostsViewModel()
    var postArray = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "POSTS"

        setupElements()
        viewModel.delegate = self
        viewModel.getApiData(idUser: "\(idUser)")
    }


}

extension PostsViewController{

    func setupElements(){
        view.addSubview(tblPosts)

        tblPosts.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblPosts.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tblPosts.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tblPosts.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

//MARK: - Protocols Delegates


extension PostsViewController: getDataProtocol{
    func loading() {
        IJProgressView.shared.showProgressView(view: self.view)
    }

    func hiddeLoading() {
        DispatchQueue.main.async {
            IJProgressView.shared.hideProgressView()
        }
    }

    func showData() {
        postArray = viewModel.postsArray
        print(postArray)
        DispatchQueue.main.async {
            self.tblPosts.reloadData()
        }
    }

    func showError(message: String) {
        Alert.Warning(delegate: self, message: message)
    }

}


extension PostsViewController :  UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return postArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else{ return UITableViewCell() }

        var title = ""
        if let title_ = postArray[indexPath.row].title {
            title = title_
        }
        var body = ""
        if let body_ = postArray[indexPath.row].body {
            body = body_
        }

        let attributeStringTtitle = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.black])
        let attributeStringBody = NSMutableAttributedString(string: "\n\(body)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributeStringTtitle.append(attributeStringBody)

        cell.lblTile.attributedText = attributeStringTtitle

        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat
    {
        return self.view.frame.width/1.8
    }


}

