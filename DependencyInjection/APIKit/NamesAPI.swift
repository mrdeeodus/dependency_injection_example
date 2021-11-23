//
//  File.swift
//  APIKit
//
//  Created by Dee Odus on 23/11/2021.
//

import Foundation

public class NamesAPI{
	
	public static let shared = NamesAPI()
	
	public func fetchData(completion: @escaping ([String]) -> Void){
		
		let url = URL(string: "https://www.stackoverflow.com")!

		let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
			guard let _ = data else {
				
				completion([])
				
				return
				
			}
			
			completion(["Dee", "James", "Peter", "Mark"])
		}

		task.resume()
	}
}
