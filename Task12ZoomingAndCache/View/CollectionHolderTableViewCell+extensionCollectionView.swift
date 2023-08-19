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
        
        switch collectionView.tag{
        case 0 :
            return DataCount.shared.secOneModal.count
        case 1 :
            return DataCount.shared.secStringModal.count
        case 2 :
            return DataCount.shared.secThreeModal.photos?.count ?? 0
        default:
            return 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath) as? ImagesCollectionViewCell else{
            return UICollectionViewCell()
        }
        
//        for itemsInCell in self.itemsInCell {
        switch collectionView.tag {
          
                case 0:
//                    cell.mainView.backgroundColor = .orange
                    cell.setUpCell(imageUrl: DataCount.shared.secOneModal[indexPath.row].thumbnailUrl ?? "")
                case 1:
                    let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
                    
                    layout?.scrollDirection = .horizontal
//                    cell.mainView.backgroundColor = .red
                    
                    cell.setUpCell(imageUrl: DataCount.shared.secStringModal[indexPath.row])
                case 2:
//                    cell.mainView.backgroundColor = .orange
                    cell.setUpCell(imageUrl: DataCount.shared.secThreeModal.photos?[indexPath.row].url ?? "")
        default:
            return UICollectionViewCell()
                
                }
            
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag{
        case 0 :
          
            delegate?()
            
            
        case 1:
           
            delegate?()
        case 2:
            
            delegate?()
            
            
        default :
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        for itemsInCell in self.itemsInCell {
        switch collectionView.tag{
            case 0 :
            return CGSize(width: collectionView.frame.width  / 4 , height: 150)
            case 1:
                return CGSize(width: collectionView.frame.width / 2, height: 150)
            case 2:
                return CGSize(width: collectionView.frame.width  / 4, height: 150)
    
        default :
            return CGSize(width: 1, height: 1)
            }
//        }
//        return CGSize(width: 1, height: 1)
    }
    
    
}
