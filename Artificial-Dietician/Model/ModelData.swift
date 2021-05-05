//
//  ModelData.swift
//  Artificial-Dietician
//
//  The file for parsing the JSON file and connecting to the database
//  Also creates teh profile and meal instances
//  Created by Cameron Triplett on 4/27/21.
//

import Foundation
import Combine

//Proifle and meal instances
final class ModelData: ObservableObject{
    
    @Published var profile = profiles[0]  //Profile instance
    @Published var meal = meals[0]  //Meal Instance
    
}

//Find the users allowed calories
func FindCalories(modelData: ModelData) -> Double{
    var allowedCalories = 0.0
    var weight: Double = 0.0
    //find average weight of past 2 weeks
    for i in 0..<modelData.profile.previousWeights.count {
        weight += Double(modelData.profile.previousWeights[i])!
    }
    weight = weight / Double(modelData.profile.previousWeights.count)
    let age: Double = Double(modelData.profile.age)!
    let height: Double = Double(modelData.profile.height)!
    //find allowed calories for males else find it for females
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

//Find amount of calories left for the user
//returns the calories left in the day
func CaloriesLeft(modelData: ModelData) -> Double{
    var caloriesAllowed = FindCalories(modelData: ModelData())
    //Substract breakfast calories from allowed calories
    for food in modelData.profile.breakfast{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    //Substract lunch calories from allowed calories
    for food in modelData.profile.lunch{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    //Subtract dinner calories from allowed calories
    for food in modelData.profile.dinner{
        for meal in meals{
            if(meal.itemName == food){
                caloriesAllowed -= Double(meal.calories)
            }
        }
    }
    return caloriesAllowed
}

//Find daily eaten protein
//Go through each meal and add the protein together
//returns the amount of protein eaten so far
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

//Find daily eaten carbs
//Go through each meal and add the carbs together
//returns the amount of carbs eaten so far
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

//Find daily eaten fats
//Go through each meal and add the fats together
//returns the amount of fats eaten so far
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

//Parse teh JSON files and store information into arrays
var meals: [Meal] = fileLoad("foodData.json")
var profiles: [Profile] = fileLoad("userData.json")
//var meals: [Meal] = APILoad("Cheddar Cheese")

//JSON file parser
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
    

