//
//  FirstViewController+extensionTableView.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import Foundation
import UIKit



extension FirstViewController : UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionHolderTableViewCell.identifier, for: indexPath) as? CollectionHolderTableViewCell else{
            return UITableViewCell()
        }
        cell.delegate = {[weak self]  in
            let id = DataCount.shared.secThreeModal.photos?[indexPath.row].id ?? -1
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
                
                return
            }
            
            vc.flag = false
            vc.thirdSelected = true
            vc.id = id
            vc.noOfRows = DataCount.shared.secThreeModal.photos?.count ?? 0
            self?.present(vc, animated: true)
        }
        cell.tableCollectionView.tag = indexPath.section
        cell.tableCollectionView.reloadData()
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = tableView.indexPathForSelectedRow
        
        
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}
