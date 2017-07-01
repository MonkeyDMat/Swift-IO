//
//  HomeViewModel.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 22/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    
    var model: HomeModel!
    @IBOutlet var tableView: UITableView?
    
    func refreshList() {
        tableView?.reloadData()
    }
}

extension HomeViewModel: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.data?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        
        let city = model.data?[indexPath.row]
        
        cell?.textLabel?.text = "\(city!.city) - \(city!.postalCode) - \(city!.country)"
        
        return cell!
    }
}
