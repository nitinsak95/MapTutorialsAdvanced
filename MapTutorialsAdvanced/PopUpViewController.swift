//
//  PopUpViewController.swift
//  MapTutorialsAdvanced
//
//  Created by AFFIXUS IMAC1 on 4/27/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import MapKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var lbmainAdd: UILabel!
    @IBOutlet weak var lbSubAdd: UILabel!
    @IBOutlet weak var mapp: MKMapView!
    
    var mainadd: String!
    var subAdd: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lbmainAdd.text = self.mainadd
        self.lbSubAdd.text = self.subAdd
    }

    @IBAction func btChange(_ sender: Any) {
        let vc: SearchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search") as! SearchViewController
    present(vc, animated: true, completion: nil)
    }
    

}
