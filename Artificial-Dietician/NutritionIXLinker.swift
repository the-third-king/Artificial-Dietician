//
//  NutritionIXLinker.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/22/21.
//

import Foundation

/*class NutritionIXLinker{
    
    func fetchMeals(userString: String, completionHandler: @escaping ([Meal]) -> Void){
        let fixedUserString = userString.replacingOccurrences(of: " ", with: "%20")
        let headers = [
            "x-rapidapi-key": "6272b3473amsh0976fc243d28f3fp110569jsnf1550474c676",
            "x-rapidapi-host": "nutritionix-api.p.rapidapi.com"
        ]

        let url = URL(string: "https://nutritionix-api.p.rapidapi.com/v1_1/search/\(fixedUserString)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_protein%2Cnf_total_carbohydrate%2Cnf_total_fat")!
        let request = NSMutableURLRequest(url: NSURL(string: "https://nutritionix-api.p.rapidapi.com/v1_1/search/\(fixedUserString)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_protein%2Cnf_total_carbohydrate%2Cnf_total_fat")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = URLSession.shared.dataTask(with: url, completionHandler: {( data, response, error) in
            if let error = error {
                print("Error with fetching meals: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code; \(response)")
                return
            }
            if let data = data,
               let mealSummary = try? JSONDecoder().decode(Meal.self, from: data){
                completionHandler(mealSummary.)
            }
        })

        task.resume()
    }
    
}*/
