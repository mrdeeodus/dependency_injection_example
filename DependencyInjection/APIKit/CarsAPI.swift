//
//  CarsAPI.swift
//  APIKit
//
//  Created by Dee Odus on 23/11/2021.
//

import Foundation

public class CarsAPI{
	
	public static let shared = CarsAPI()
	
	public func fetchCarData(completion: @escaping ([String]) -> Void){
		
		let url = URL(string: "https://www.apple.com")!

		let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
			guard let _ = data else {
				
				completion([])
				
				return
				
			}
			
			completion(["Range Rover", "Bentley", "Ferrari", "Mercedes"])
		}

		task.resume()
	}
}
