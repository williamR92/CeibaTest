//
//  ViewController.swift
//  testCeibaWilliam
//
//  Created by Desarrollo MAC on 10/5/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    var viewModel = HomeViewModel()
    var usersArray = [UserData]()
    var userSelected : UserData?

//MARK: - UI Components
    lazy var tblUsers: UITableView = {
        let tbv = UITableView()
        tbv.separatorStyle = .none
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.delegate = self
        tbv.dataSource = self
        tbv.register(UserCell.self, forCellReuseIdentifier: "cell")
        return tbv
    }()

    lazy var  searchV : UISearchController = {
        let srv = UISearchController(searchResultsController: nil)
        srv.obscuresBackgroundDuringPresentation = false
        srv.searchBar.sizeToFit()
        srv.searchBar.placeholder = "Search User"
        srv.searchBar.searchBarStyle = .prominent
        srv.searchResultsUpdater = self
        return srv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CEIBA TEST WILLIAM"
        navigationItem.searchController = searchV
        setupElements()
        viewModel.delegate = self
        viewModel.getApiData()
    }


    func setupElements(){
        view.addSubview(tblUsers)
        tblUsers.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tblUsers.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tblUsers.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tblUsers.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    // MARK: - Actions Buttons
    @objc func goPosts(_ sender : AnyObject){
        userSelected = usersArray[sender.tag]
        self.performSegue(withIdentifier: "goToPosts", sender: self)
    }

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPosts" {
            if let destinationVC = segue.destination as? PostsViewController {
                print(userSelected?.id as Any)
                guard let id = userSelected?.id else{
                    Alert.Warning(delegate: self, message: "Error ID User!")
                    return
                }
                destinationVC.idUser = id
            }
        }

    }
}

//MARK: - Protocols Delegates

extension ViewController : UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > 0 {
            let filtered = self.viewModel.usersArray?.filter {
                return $0.name?.range(of: text, options: .caseInsensitive) != nil
            }
            self.usersArray = filtered!
        }else{
            fillArray()
        }
        self.tblUsers.reloadData()
    }

    func fillArray() {
        guard let array = self.viewModel.usersArray else {return}
        self.usersArray = array
    }
}

extension ViewController: getDataProtocol{
    func loading() {
        IJProgressView.shared.showProgressView(view: self.view)
    }

    func hiddeLoading() {
        DispatchQueue.main.async {
            IJProgressView.shared.hideProgressView()

        }
    }

    func showData() {
        usersArray = viewModel.usersArray
        print(usersArray)
        DispatchQueue.main.async {
            self.tblUsers.reloadData()
        }
    }

    func showError(message: String) {
        DispatchQueue.main.async {
            Alert.Warning(delegate: self, message: message)
        }
    }

}

extension ViewController :  UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserCell else{ return UITableViewCell() }

        cell.lblName.text = usersArray[indexPath.row].name
        cell.lblPhone.text = usersArray[indexPath.row].phone
        cell.lblEmail.text = usersArray[indexPath.row].email
        cell.btnPublications.tag = indexPath.row
        cell.btnPublications.addTarget(self, action: #selector(ViewController.goPosts(_:)), for: UIControl.Event.touchUpInside)

        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath)->CGFloat
    {
        return self.view.frame.width/2.3
    }


}
