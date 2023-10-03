//
//  ViewController.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 28.09.2023.
//

import UIKit
enum CellType: String {
    case marketCell = "Alışveriş Görünümü"
    case regularCell = "Liste Görünümü"
    case detailedCell = "Detaylı Liste"
}
class ViewController: UIViewController {
    

    @IBOutlet weak var btnViewOptions: UIButton!
    @IBOutlet weak var tblProducts: UITableView!
    var cellType: CellType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblProducts.register(UINib(nibName: "MarketCell", bundle: .main), forCellReuseIdentifier: "MarketCell")
        tblProducts.register(UINib(nibName: "detailCell", bundle: .main), forCellReuseIdentifier: "detailCell")
        tblProducts.dataSource = self
        tblProducts.delegate = self
        cellType = .marketCell
    }

    @IBAction func btnViewOptionsAction(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let optionsViewController = storyBoard.instantiateViewController(withIdentifier: "OptionsViewController") as? OptionsViewController else {return}
        optionsViewController.modalPresentationStyle = .overFullScreen
        optionsViewController.modalTransitionStyle = .crossDissolve
        optionsViewController.optionsDelegate = self
        self.present(optionsViewController, animated: true)
    }
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellType {
        case .marketCell:
            return CGFloat(tblProducts.bounds.height)
        case .detailedCell:
            return 80
        case .regularCell:
            return 80
        case .none:
            return 0
        }
       
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellType {
        case .detailedCell:
            return 10
        case .marketCell:
            return 1
        case .regularCell:
            return 10
        case .none:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cellType {
        case .marketCell:
            guard let cell = tblProducts.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as? MarketCell else {return UITableViewCell()}
            return cell
        case .none:
            return UITableViewCell()
        case .some(.regularCell):
            guard let cell = tblProducts.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? detailCell else {return UITableViewCell()}
            cell.setCell(title: "title", subTitle: "subtitle", detailTitle: nil, image: UIImage(systemName: "paperplane.fill") ?? UIImage(), isDetail: false)
            cell.cellSelectionHandler = {
                print("cell selected at \(indexPath.row)")
            }
            return cell
        case .some(.detailedCell):
            guard let cell = tblProducts.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? detailCell else {return UITableViewCell()}
            cell.setCell(title: "title", subTitle: "subtile", detailTitle: "detailtitle", image: UIImage(systemName: "paperplane.fill") ?? UIImage(), isDetail: true)
            cell.cellSelectionHandler = {
                print("cell selected at \(indexPath.row)")
            }
            return cell
        }
      
    }
}
//lifecycle methods
extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("it appears")
    }
}

extension ViewController: OptionsDelegate {
    
    func didSelect(_ option: CellType) {
        cellType = option
        if option == .marketCell {
            tblProducts.isScrollEnabled = false
        }else {
            tblProducts.isScrollEnabled = true
        }
        tblProducts.reloadData()
        
    }
}

