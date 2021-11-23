//
//  DetailsViewController.swift
//  ListUIKit
//
//  Created by Dee Odus on 23/11/2021.
//

import UIKit

public protocol NamesAPIFetchable{
	
	func fetchData(completion: @escaping ([String]) -> Void)
}

public protocol CarsAPIFetchable{
	
	func fetchCarData(completion: @escaping ([String]) -> Void)
}

public class DetailsViewController: UIViewController {

	private let tableView: UITableView = {
		
		let table = UITableView()
		table.register(UINib.init(nibName: "CarOwnerCell", bundle: Bundle.init(identifier: "net.Apptimist.ListUIKit")), forCellReuseIdentifier: "cell")
		return table
		
	}()
	
	private var carOwners = [CarOwners]()
	
	var namesAPIResult: NamesAPIFetchable
	var carsAPIResult: CarsAPIFetchable
	
	public init(namesAPIResult: NamesAPIFetchable, carsAPIResult: CarsAPIFetchable){
		
		self.namesAPIResult = namesAPIResult
		self.carsAPIResult = carsAPIResult
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
    public override func viewDidLoad() {
        super.viewDidLoad()

		view.addSubview(tableView)
		tableView.dataSource = self
		
		namesAPIResult.fetchData { names_results in
			print(names_results)
			
			if names_results.count > 0{
				
				self.carsAPIResult.fetchCarData { car_results in
					
					print(car_results)
					
					for index in 0..<car_results.count{
						
						self.carOwners.append(CarOwners.init(name: names_results[index], car: car_results[index]))
					}
					
					DispatchQueue.main.async {
						self.tableView.reloadData()
					}
				}
			}
			
		}
        
    }
	
	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		tableView.frame = view.bounds
		tableView.rowHeight = 114
	}
    
}


extension DetailsViewController: UITableViewDataSource{
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return carOwners.count
	}
	
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let carOwner = carOwners[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarOwnerCell
		
		cell.carOwner = carOwner
		
		return cell
	}
	
	
}
