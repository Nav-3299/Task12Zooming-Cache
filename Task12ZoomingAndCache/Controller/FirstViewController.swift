//
//  ViewController.swift
//  Task12ZoomingAndCache
//
//  Created by Navpreet Kaur on 13/08/23.
//

import UIKit

enum SectionsOfTableView{
    case top
    case middle
    case bottom
}



class FirstViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var ImageHolderTableView: UITableView!
    
    //MARK: Variables
    var arrayOfSections : [SectionsOfTableView] = [.top , .middle , .bottom]
    
    var secOneModal = [SectionOneModal]()
    var secStringModal = [String]()
    var secThreeModal = SectionThreeModal()
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
        NetworkManager.shared.callApi(callType: [SectionOneModal].self, url: ApiStrings.sectionOneApi) {[weak self] result in
            self?.secOneModal = result
            print("🐔 \(self?.secOneModal ?? [])")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.callApi(callType: [String].self, url: ApiStrings.sectionTwoApi) {[weak self] result in
            self?.secStringModal = result
            print("😊 \(self?.secStringModal ?? [])")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.callApi(callType: SectionThreeModal.self, url: ApiStrings.sectionThreeApi) {[weak self] result in
            self?.secThreeModal = result
            print("👻 \(self?.secThreeModal.photos ?? [])")
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.ImageHolderTableView.reloadData()
        }
    }
}


