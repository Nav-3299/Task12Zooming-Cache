//
//  showSelectedImagesCollectionViewCell.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 14/08/23.
//

import UIKit

class showSelectedImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgImageView: UIImageView!
    var closure : (() -> ())?
    var index : IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func setUpCell(flag : Bool,identifier : String = "" , id : Int = -1){
        
        if DataCount.shared.cache[identifier] != nil{
            self.imgImageView.image = DataCount.shared.cache[identifier]

            
        }else{
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: identifier)!)) { data, _, _ in
                if let data = data{
                        DataCount.shared.cache[identifier] = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imgImageView.image = DataCount.shared.cache[identifier]
                            
                    }
                    self.closure!()
                    
                    
                }
            }.resume()
        }
        
        
      
    }
}
