//
//  OptionsViewController.swift
//  SahibindenUIChallange
//
//  Created by Namik Karabiyik on 29.09.2023.
//

import UIKit
protocol OptionsDelegate {
    func didSelect(_ option: CellType)
}
class OptionsViewController: UIViewController {

    @IBOutlet weak var tblOptions: UITableView!
    let options = ["Liste Görünümü", "Alışveriş Görünümü", "Detaylı Liste"]
    var optionsDelegate: OptionsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        tblOptions.register(UINib(nibName: "OptionsCell", bundle: .main), forCellReuseIdentifier: "OptionsCell")
        tblOptions.dataSource = self
        tblOptions.delegate = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    
 
}
extension OptionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item selected: \(self.options[indexPath.row])")
        let selectedCell = CellType(rawValue: self.options[indexPath.row])
        self.dismiss(animated: true) {
            self.optionsDelegate?.didSelect(selectedCell ?? .marketCell)
        }
    }
}

extension OptionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblOptions.dequeueReusableCell(withIdentifier: "OptionsCell") as? OptionsCell else {return UITableViewCell()}
        cell.setOptionLabel(option: options[indexPath.row])
        cell.optionHandler = {
            print("item selected: \(self.options[indexPath.row])")
            let selectedCell = CellType(rawValue: self.options[indexPath.row])
            self.dismiss(animated: true) {
                self.optionsDelegate?.didSelect(selectedCell ?? .marketCell)
            }
        }
        return cell
    }
}
