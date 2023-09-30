//
//  ViewController.swift
//  localizationDemo
//
//  Created by Itsuki on 2023/09/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let tableViewSource: [String] = [
        NSLocalizedString("一", tableName: "TopHalfLocalizable", comment: "table view source"),
        NSLocalizedString("二", tableName: "TopHalfLocalizable", comment: "table view source"),
        NSLocalizedString("三", tableName: "TopHalfLocalizable", comment: "table view source"),
        NSLocalizedString("四", tableName: "BottomHalfLocalizable", comment: "table view source"),
        NSLocalizedString("五", tableName: "BottomHalfLocalizable", comment: "table view source"),
        NSLocalizedString("六", tableName: "BottomHalfLocalizable", comment: "table view source"),
    ]
    

    
    
//    let tableViewSource: [String] = [
//        "一".localize(comment: "table view source"),
//        "二".localize(comment: "table view source"),
//        "三".localize(comment: "table view source"),
//        "四".localize(comment: "table view source"),
//        "五".localize(comment: "table view source"),
//        "六".localize(comment: "table view source"),
//
//    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func onOpenPreferenceButtonPressed(_ sender: UIButton) {
        
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func onSwitchLanguageButtonPressed(_ sender: UIButton) {
        UserDefaults.standard.set(["en-US"], forKey: "AppleLanguages")
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell")! as UITableViewCell
        cell.textLabel?.text = tableViewSource[indexPath.row]
        return cell
    }

}

