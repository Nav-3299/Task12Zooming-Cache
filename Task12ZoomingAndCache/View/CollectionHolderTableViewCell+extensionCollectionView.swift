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
        
//        return min(DataCount.shared.secOneModal.count, DataCount.shared.secStringModal.count, DataCount.shared.secThreeModal.photos?.count ?? 0)
        
        
//        for item in itemsInCell{
//            switch item{
//                
//            case .top:
//                return DataCount.shared.secOneModal.count
//            case .middle:
//                return DataCount.shared.secStringModal.count
//            case .bottom:
//                return DataCount.shared.secThreeModal.photos?.count ?? 0
//           
//            }
//            
//        }
//        return 0
        
//        switch self.section{
//            
//        case .top:
//            return DataCount.shared.secOneModal.count
//        case .middle:
//            return DataCount.shared.secStringModal.count
//        case .bottom:
//            return DataCount.shared.secThreeModal.photos?.count ?? 0
//        case .none:
//            return 0
//        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesCollectionViewCell.identifier, for: indexPath) as? ImagesCollectionViewCell else{
            return UICollectionViewCell()
        }
        
//        for itemsInCell in self.itemsInCell {
        switch collectionView.tag {
          
                case 0:
                    cell.mainView.backgroundColor = .orange
                    cell.setUpCell(imageUrl: DataCount.shared.secOneModal[indexPath.row].thumbnailUrl ?? "")
                case 1:
                    let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
                    
                    layout?.scrollDirection = .horizontal
                    cell.mainView.backgroundColor = .red
                    
                    cell.setUpCell(imageUrl: DataCount.shared.secStringModal[indexPath.row])
                case 2:
                    cell.mainView.backgroundColor = .orange
                    cell.setUpCell(imageUrl: DataCount.shared.secThreeModal.photos?[indexPath.row].url ?? "")
        default:
            return UICollectionViewCell()
                
                }
            
//        }
        
        
//        switch self.section{
//        case .top:
//            cell.mainView.backgroundColor = .orange
//            cell.setUpCell(imageUrl: DataCount.shared.secOneModal[indexPath.row].thumbnailUrl ?? "")
//        case .middle:
//            let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
//            
//            layout?.scrollDirection = .horizontal
//            cell.mainView.backgroundColor = .red
//            
//            cell.setUpCell(imageUrl: DataCount.shared.secStringModal[indexPath.row])
//        case .bottom:
//            cell.mainView.backgroundColor = .orange
//            cell.setUpCell(imageUrl: DataCount.shared.secThreeModal.photos?[indexPath.row].url ?? "")
//
//        case .none:
//            return UICollectionViewCell()
//        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag{
        case 0 :
            let id = DataCount.shared.secOneModal[indexPath.row].id
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
                
                return
            }
            
            vc.flag = false
            vc.thirdSelected = false
            vc.id = id
            vc.noOfRows = DataCount.shared.secOneModal.count
            delegate!(vc)
            
            
        case 1:
            let valueOfUrl = DataCount.shared.secStringModal[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
                
                return
            }
            vc.flag = true
            vc.thirdSelected = false
            vc.noOfRows = DataCount.shared.secStringModal.count
            vc.stringId = valueOfUrl
            delegate!(vc)
        case 2:
            let id = DataCount.shared.secThreeModal.photos?[indexPath.row].id ?? -1
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            
            guard let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else{
                
                return
            }
            
            vc.flag = false
            vc.thirdSelected = true
            vc.id = id
            vc.noOfRows = DataCount.shared.secThreeModal.photos?.count ?? 0
            delegate!(vc)
            
            
        default :
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        for itemsInCell in self.itemsInCell {
        switch collectionView.tag{
            case 0 :
            return CGSize(width: self.frame.width - 10 / 6 , height: 150)
            case 1:
                return CGSize(width: self.frame.width - 10 / 2, height: 150)
            case 2:
                return CGSize(width: self.frame.width - 10 / 3, height: 150)
    
        default :
            return CGSize(width: 1, height: 1)
            }
//        }
//        return CGSize(width: 1, height: 1)
    }
    
    
}
