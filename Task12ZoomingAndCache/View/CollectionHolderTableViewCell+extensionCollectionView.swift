//
//  CollectionHolderTableViewCell+extensionCollectionView.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import Foundation
import UIKit

extension CollectionHolderTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch self.section.section{
        case 0 :
            return 10
        case 1:
            return 10
        case 2:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath) as? ImagesCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        if self.section.section == 1{
            layout?.scrollDirection = .horizontal
            cell.mainView.backgroundColor = .red
        }else{
            layout?.scrollDirection = .vertical
            cell.mainView.backgroundColor = .orange
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.section.section{
        case 0 :
            return CGSize(width: collectionView.frame.width / 4 , height: collectionView.frame.height - 5)
        case 1:
            return CGSize(width: collectionView.frame.width / 2 - 10 , height: collectionView.frame.height - 5)
        case 2:
            return CGSize(width: collectionView.frame.width / 4 , height: collectionView.frame.height - 5)
        default:
            return CGSize(width: 1, height: 1)
            
        }
    }
    
    
}
