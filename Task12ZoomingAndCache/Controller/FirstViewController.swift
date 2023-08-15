//
//  ViewController.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import UIKit

enum SectionsOfTableView : CaseIterable{
    case top
    case middle
    case bottom
}



class FirstViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var ImageHolderTableView: UITableView!
    
    //MARK: Variables
    var arrayOfSections : [SectionsOfTableView] = [.top , .middle , .bottom]
    
   
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        getResponseFromApi()
    }

    //MARK: Functions
    func registerTableView(){
        ImageHolderTableView.register(UINib(nibName: CollectionHolderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CollectionHolderTableViewCell.identifier)
        ImageHolderTableView.delegate = self
        ImageHolderTableView.dataSource = self
    }
    
    func getResponseFromApi(){
        let group = DispatchGroup()
        
        group.enter()
        NetworkManager.shared.callApi(callType: [SectionOneModal].self, url: ApiStrings.sectionOneApi) { result in
            DataCount.shared.secOneModal = result
            print("🐔 \(DataCount.shared.secOneModal)")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.callApi(callType: [String].self, url: ApiStrings.sectionTwoApi) { result in
            DataCount.shared.secStringModal = result
            print("😊 \( DataCount.shared.secStringModal )")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.callApi(callType: SectionThreeModal.self, url: ApiStrings.sectionThreeApi) { result in
            DataCount.shared.secThreeModal = result
            print("👻 \(DataCount.shared.secThreeModal.photos ?? [])")
            group.leave()
        }
        
        Task{
            
        }
        group.notify(queue: .main) {
            self.ImageHolderTableView.reloadData()
        }
    }
}


