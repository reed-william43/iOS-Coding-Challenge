//
//  ViewModel.swift
//  iOS-take-home
//
//  Created by William Reed on 11/1/23.
//
//  Fetch API Endpoint 1

import Foundation
import SwiftUI

struct Details: Hashable, Codable{
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strYoutube: String
    let strMealThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
}

struct Dessert: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

class ViewModel: ObservableObject {
    @Published var desserts: [String: Dessert] = [:]
    
    func fetch() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            // convert to JSON
            do {
                let response = try JSONDecoder().decode([String: [Dessert]].self, from: data)
                if let desserts = response["meals"] {
                    // Sort desserts by their names (strMeal) in alphabetical order
                    let sortedDesserts = desserts.sorted { $0.strMeal < $1.strMeal }
                                    
                    DispatchQueue.main.async {
                        self?.desserts = sortedDesserts.reduce(into: [:]) { dictionary, dessert in
                            dictionary[dessert.idMeal] = dessert
                        }
                    }
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

class DessertDetails: ObservableObject {
    @Published var details: Details?
    
    subscript(key: String) -> String? {
        return details?.idMeal
        }
    
    func getID() -> String {
        return details!.idMeal
    }
    
    func fetchDetails(forMealID idMeal: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode([String: [Details]].self, from: data)
                if let meals = response["meals"], let firstMeal = meals.first {
                    DispatchQueue.main.async {
                        self?.details = firstMeal
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func printIngredientsAndMeasurements() -> String {
        let mirror = Mirror(reflecting: self)
        print("ingredients")
        var returnVal: String = ""
        
        for i in 1...20 {
            let ingredientKey = "strIngredient\(i)"
            let measurementKey = "strMeasure\(i)"
            
            for (label, value) in mirror.children {
                if let label = label, label == ingredientKey,
                    let ingredient = value as? String,
                    label == measurementKey,
                    let measurement = value as? String,
                    !ingredient.isEmpty && !measurement.isEmpty {
                    returnVal = "\(ingredient): \(measurement)"
                    return returnVal
                }
            }
            
        }
        return returnVal
    }

}
