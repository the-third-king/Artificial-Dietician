//
//  NutritionIXLinker.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/22/21.
//
/*
import Foundation

class NutritionIXLinker: ViewController{
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        let url = URL(string: "https://nutritionix-api.p.rapidapi.com/v1_1/search/cheddar%20cheese?fields=item_name%2Citem_id%2Cbrand_name%2cnf_calories%2Cnf_total_fat")
        
        guard url != nil else {
            print("error creating url object")
            return
        }
        
        
            
        var request = URLRequest(url: url! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
        
        let headers = [ "x-rapidapi-key": "6272b3473amsh0976fc243d28f3fp110569jsnf1550474c676",
                                    "x-rapidapi-host": "nutritionix-api.p.rapidapi.com"]
        
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
            
            
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error ) -> Void in
            if (error != nil){
                print(error)
            }else{
                let httpResponse = response as?HTTPURLResponse
                print(httpResponse)
            }
        })
            
        dataTask.resume()
            
    }


    
}*/
