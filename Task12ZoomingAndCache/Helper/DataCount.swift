//
//  DataCount.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 14/08/23.
//

import Foundation

class DataCount{
    static let shared = DataCount()
    private init(){}
    
    var secOneModal = [SectionOneModal]()
    var secStringModal = [String]()
    var secThreeModal = SectionThreeModal()
}
