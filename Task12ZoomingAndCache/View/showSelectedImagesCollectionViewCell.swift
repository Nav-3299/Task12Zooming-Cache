//
//  showSelectedImagesCollectionViewCell.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 14/08/23.
//

import UIKit

class showSelectedImagesCollectionViewCell: UICollectionViewCell , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var imgImageView: UIImageView!
    var closure : ((IndexPath) -> ())?
    var index : IndexPath!
    
    var panGesture : UIPanGestureRecognizer!
    var pinchGesture : UIPinchGestureRecognizer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgImageView.isUserInteractionEnabled = true
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        imgImageView.addGestureRecognizer(pinchGesture)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//        imgImageView.addGestureRecognizer(panGesture)
    }
    
    
    func setUpCell(flag : Bool,identifier : String = "" , id : Int = -1){
        
        if DataCount.shared.cache[identifier] != nil{
            
            self.imgImageView.image = DataCount.shared.cache[identifier]
            
        }
        else{
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: identifier)!)) { data, _, _ in
                
                if let data = data{
                    DispatchQueue.main.async { [weak self] in
                        self?.imgImageView.image = UIImage(data: data)
                        DataCount.shared.cache[identifier] = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
   
    @objc func handlePinch(_ gesture : UIPinchGestureRecognizer){
        guard let view = gesture.view else {return}
        
        if gesture.state == .changed || gesture.state == .ended{
            let currentScale = view.frame.size.width / view.bounds.size.width
            
            var newScale = currentScale * gesture.scale
            newScale = max(newScale , 1.0)
            newScale = min(newScale , 10.0)
            
            let transform = CGAffineTransform(scaleX: newScale, y: newScale)
            view.transform = transform
            gesture.scale = 1.0
        }
    }
    
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }

        if gesture.state == .changed {
            let translation = gesture.translation(in: view.superview)
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: view.superview)
        }
    }

}
