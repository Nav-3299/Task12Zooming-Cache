//
//  SectionThreeModal.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import Foundation
import UIKit

struct SectionThreeModal : Codable{
  
    var success : Bool?
    var message : String?
    var offset : Int?
    var limit : Int?
    var photos : [Photos]?
}

struct Photos : Codable{
    var description : String?
    var id : Int?
    var url : String?
    var user: Int?
    var title : String?
}


