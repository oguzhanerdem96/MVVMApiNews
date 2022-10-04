//
//  WebService.swift
//  MVVMApiNews
//
//  Created by Oğuzhan Erdem on 4.10.2022.
//

import Foundation

class WebService {
    
    func haberleriIndır(url: URL, completion: @escaping([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data  {
               let haberlerDizisi = try? JSONDecoder().decode([News].self, from: data)
                if let haberlerDizisi = haberlerDizisi{
                    completion(haberlerDizisi)
                }
            }
            
        } .resume()
    }
}
