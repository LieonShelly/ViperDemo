//
//  AddressListViewController.swift
//  ViperDemo
//
//  Created by lieon on 2019/7/3.
//  Copyright © 2019 lieon. All rights reserved.
//

import UIKit

class AddressListViewController: UIViewController {
    var presenter: AddressListPresenterInterface?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AddressListTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressListTableViewCell")
    }
    
    @IBAction func btnTap(_ sender: Any) {
        presenter?.addNewAddressTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
    }
}

extension AddressListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getAddressViewModels().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListTableViewCell", for: indexPath) as! AddressListTableViewCell
        let addressmodel = presenter!.getAddressViewModels()[indexPath.row]
        cell.connfig(addressmodel)
        return cell
    }
}

extension AddressListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.adressSelected()
    }
}

extension AddressListViewController: AddressListViewInterface {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func reloadData() {
        
    }
    
    func setupInitialView() {
        
    }
    
    func setScreenTitle(with title: String) {
        self.title = title
    }
    
    
}
