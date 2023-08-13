//
//  ImagesCollectionViewCell.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var holderImageView: UIImageView!
    
    static let identifier = "ImagesCollectionViewCell"
    var section : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if section == 2{
            holderImageView.layer.cornerRadius = holderImageView.frame.height / 2
        }
        
        setUpView()
    }

    
    func setUpView(){
        
    }
    
    func setUpCell(imageUrl : String){
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: imageUrl)!)){[weak self] data , response , error in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let data = data {
                print(data)
            }
        }
    }
}
