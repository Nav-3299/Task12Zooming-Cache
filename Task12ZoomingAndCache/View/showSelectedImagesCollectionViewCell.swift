//
//  showSelectedImagesCollectionViewCell.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 14/08/23.
//

import UIKit

class showSelectedImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgImageView: UIImageView!
    var closure : ((IndexPath) -> ())?
    var index : IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setUpCell(flag : Bool,identifier : String = "" , id : Int = -1){
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: identifier)!)) { data, _, _ in
            
            if let data = data{
                DispatchQueue.main.async { [weak self] in
                    self?.imgImageView.image = UIImage(data: data)
//                    self?.closure!(self!.index)
                }
            }
        }.resume()
    }
}
