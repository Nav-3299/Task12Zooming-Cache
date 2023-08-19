//
//  CollectionHolderTableViewCell.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import UIKit


class CollectionHolderTableViewCell: UITableViewCell {
//MARK: OUTLETS
    @IBOutlet weak var mainViewTVC: UIView!
    @IBOutlet weak var tableCollectionView: UICollectionView!
    
 //MARK: VARIABLE
    static let identifier = "CollectionHolderTableViewCell"
    var section : SectionsOfTableView!
    var itemsInCell : [SectionsOfTableView] = [.top , .middle , .bottom]
    var delegate : (()->())?
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("Before Registration")
        registerCollectionViewCell()
        print("After Registration")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func registerCollectionViewCell(){
        tableCollectionView.register(UINib(nibName: ImagesCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImagesCollectionViewCell.identifier)
        tableCollectionView.delegate = self
        tableCollectionView.dataSource = self
        
    }
}
