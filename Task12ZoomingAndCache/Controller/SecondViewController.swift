//
//  SecondViewController.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 14/08/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var showselectedImagesCollectionView: UICollectionView!
    
    var noOfRows : Int! = 0
    var id : Int?
    var stringId : String?
    var flag = false // for middle element it will be switched to true
    var thirdSelected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        showselectedImagesCollectionView.register(UINib(nibName: "showSelectedImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "showSelectedImagesCollectionViewCell")
        
        showselectedImagesCollectionView.delegate = self
        showselectedImagesCollectionView.dataSource = self
//        let layout = showselectedImagesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
//        
//        layout?.scrollDirection = .horizontal
//        showselectedImagesCollectionView.reorderingCadence = .fast
//        showselectedImagesCollectionView.reloadData()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        showselectedImagesCollectionView.reloadData()
    }
    
    
}


extension SecondViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showSelectedImagesCollectionViewCell", for: indexPath) as? showSelectedImagesCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        
        
        if flag{
            cell.setUpCell(flag : flag,identifier: DataCount.shared.secStringModal[indexPath.row])
        }else{
            if thirdSelected{
                cell.setUpCell(flag: flag , identifier: DataCount.shared.secThreeModal.photos?[indexPath.row].url ?? "" , id : id ?? -1)
            }else{
                cell.setUpCell(flag : flag,identifier: DataCount.shared.secOneModal[indexPath.row].thumbnailUrl ?? "",id: id ?? -1)
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 500)
    }
    
}
