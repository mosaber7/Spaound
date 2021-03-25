//
//  detailsViewController.swift
//  Spaound
//
//  Created by Saber on 22/03/2021.
//

import UIKit
import Cosmos

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var priceContiner: UIView!
    
    @IBOutlet weak var ratingStarsContainer: UIView!
    
    lazy var starsView: CosmosView = {
        let view = CosmosView()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ratingStarsContainer.addSubview(starsView.self)
        tableView.registerNib(cell: AmenitiesCell.self)
        tableView.registerNib(cell: AboutSpaceCell.self)
        tableView.registerNib(cell: AvailabilityTimes.self)
        tableView.registerNib(cell: ContactInfoCell.self)
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        backButton.layer.cornerRadius = 8
        priceContiner.layer.cornerRadius = 8
    }
    
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    enum detailsTableSections: String, CaseIterable {
        case Amenities
        case AboutSpace = "About This Space"
  //      case AdditionalPrices = "Additional Prices"
        case AvailabilityTimes = "Availability Times"
        case ContactInformation = "Contact Information"
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue() as AmenitiesCell
            return cell
        case 1:
            let cell = tableView.dequeue() as AboutSpaceCell
            return cell
        case 2:
            let cell = tableView.dequeue() as AvailabilityTimes
            
            return cell
        case 3:
            let cell = tableView.dequeue() as ContactInfoCell
            return cell
            
        default:
            preconditionFailure("unexcpected section")
        }
    }

   /*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: 180, height: 16)) //set these values as necessary
                returnedView.backgroundColor = .clear

                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 16))
        label.textColor = UIColor(named: "mainLabelColor")

                label.text =  detailsTableSections.allCases[section].rawValue
                returnedView.addSubview(label)

                return returnedView
            }*/
    
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        detailsTableSections.allCases[section].rawValue
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        detailsTableSections.allCases.count
    }
    
    
    
}


