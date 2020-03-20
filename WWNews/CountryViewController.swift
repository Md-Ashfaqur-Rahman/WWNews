//
//  CountryViewController.swift
//  WWNews
//
//  Created by Md Ashfaqur Rahman on 19/3/20.
//  Copyright © 2020 Md Ashfaqur Rahma. All rights reserved.
//

import UIKit

enum CountryType: Int {
    case ar
    case au
    case at
    case be
    case br
    case bg
    case ca
    case cn
    case co
    case cu
    case cz
    case eg
    case fr
    case de
    case gr
    case hk
    case hu
    case ind
    case id
    case ie
    case il
    case it
    case jp
    case lv
    case lt
    case my
    case mx
    case ma
    case nl
    case nz
    case ng
    case no
    case ph
    case pl
    case pt
    case ro
    case ru
    case sa
    case rs
    case sg
    case sk
    case si
    case za
    case kr
    case se
    case ch
    case tw
    case th
    case tr
    case ae
    case ua
    case gb
    case us
    case ve
}

class CountryViewController: UITableViewController {

    var didTapCountryType: ((CountryType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let countryType = CountryType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(countryType)")
            self?.didTapCountryType?(countryType)
        }
    }
}
