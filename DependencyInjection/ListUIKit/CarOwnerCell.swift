//
//  CarOwnerCell.swift
//  ListUIKit
//
//  Created by Dee Odus on 23/11/2021.
//

import UIKit

class CarOwnerCell: UITableViewCell {

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var carLabel: UILabel!
	
	var carOwner: CarOwners?{
		
		didSet{
			
			nameLabel.text = carOwner?.name
			carLabel.text = carOwner?.car
		}
	}
	
}
