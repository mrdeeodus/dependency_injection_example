//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Dee Odus on 23/11/2021.
//

import UIKit
import ListUIKit
import APIKit

extension NamesAPI: NamesAPIFetchable { }
extension CarsAPI: CarsAPIFetchable { }

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	@IBAction func showDetailsScreen(_ sender: Any) {
		
		let vc = DetailsViewController(namesAPIResult: NamesAPI.shared, carsAPIResult: CarsAPI.shared)
		
		vc.view.backgroundColor = .white
		present(vc, animated: true, completion: nil)
	}
	
}

