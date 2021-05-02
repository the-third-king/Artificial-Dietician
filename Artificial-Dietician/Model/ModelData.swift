//
//  ModelData.swift
//  Artificial-Dietician
//
//  The file for parsing the JSON file and connecting to the database
//  Created by Cameron Triplett on 4/27/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
    
    @Published var profile = profiles[0]
    @Published var meal = meals[0]
    
}

func FindCalories(modelData: ModelData) -> Double{
    var allowedCalories = 0.0
    let age: Double = Double(modelData.profile.age)!
    let height: Double = Double(modelData.profile.height)!
    let weight: Double = Double(modelData.profile.weight)!
    if modelData.profile.sex == "M" {
        allowedCalories = (10.0 * weight / 2.2)
        allowedCalories += (6.25 * height * 2.54)
        allowedCalories -= (5.0 * age + 5.0)
    }else{
        allowedCalories = Double((10.0 * weight / 2.2))
        allowedCalories += (6.25 * height * 2.54)
        allowedCalories -= (5.0 * age - 161.0)
    }
    return allowedCalories
}

func CaloriesLeft(modelData: ModelData) -> Double{
    var caloriesAllowed = FindCalories(modelData: ModelData())
    for food in modelData.profile.breakfast{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    for food in modelData.profile.lunch{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    for food in modelData.profile.dinner{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    return caloriesAllowed
}

func DailyProtein(modelData: ModelData) -> Int {
    var protein = 0
    for food in modelData.profile.breakfast{
        for meal in meals{
            if(meal.itemName == food){
                protein += meal.protein
            }
        }
    }
    for food in modelData.profile.lunch{
        for meal in meals{
            if(meal.itemName == food){
                protein += meal.protein
            }
        }
    }
    for food in modelData.profile.dinner{
        for meal in meals{
            if(meal.itemName == food){
                protein += meal.protein
            }
        }
    }
    
    return protein
}

func DailyCarbohydrates(modelData: ModelData) -> Int{
    var carbs = 0
    for food in modelData.profile.breakfast{
        for meal in meals{
            if(meal.itemName == food){
                carbs += meal.carbohydrates
            }
        }
    }
    for food in modelData.profile.lunch{
        for meal in meals{
            if(meal.itemName == food){
                carbs += meal.carbohydrates
            }
        }
    }
    for food in modelData.profile.dinner{
        for meal in meals{
            if(meal.itemName == food){
                carbs += meal.carbohydrates
            }
        }
    }
    
    return carbs
}

func DailyFats(modelData: ModelData) -> Int{
    var fats = 0
    for food in modelData.profile.breakfast{
        for meal in meals{
            if(meal.itemName == food){
                fats += meal.fat
            }
        }
    }
    for food in modelData.profile.lunch{
        for meal in meals{
            if(meal.itemName == food){
                fats += meal.fat
            }
        }
    }
    for food in modelData.profile.dinner{
        for meal in meals{
            if(meal.itemName == food){
                fats += meal.fat
            }
        }
    }
    
    return fats
}

var meals: [Meal] = fileLoad("foodData.json")
var profiles: [Profile] = fileLoad("userData.json")
//var meals: [Meal] = APILoad("Cheddar Cheese")

func fileLoad<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
    
    //API connector
/*func APILoad<T: Decodable>(_ userString: String) -> T {
    var data: Data
        let fixedUserString = userString.replacingOccurrences(of: " ", with: "%20")
        
        let headers = [
            "x-rapidapi-key": "6272b3473amsh0976fc243d28f3fp110569jsnf1550474c676",
            "x-rapidapi-host": "nutritionix-api.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://nutritionix-api.p.rapidapi.com/v1_1/search/\(fixedUserString)?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_protein%2Cnf_total_carbohydrate%2Cnf_total_fat")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                do{
                    data = try Data(contentsOf: Data(httpResponse))
                }catch{
                    fatalError("Couldn't load \(userString) rom main bundle: \n\(error)")
                }
                do{
                    let decoder = JSONDecoder()
                    return try decoder.decode(T.self, from: httpResponse)
                }catch{
                    fatalError("Couldn't parse API \(userString) as \(T.self):\n\(error)"
                }
                print(httpResponse)
            }
        })

        dataTask.resume()
    do{
        return try JSONDecoder().decode(T.self, from: data)
    }catch{
        fatalError("Messed up")
    }
}*/
    

