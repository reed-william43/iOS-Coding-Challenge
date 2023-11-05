//
//  ContentView.swift
//  iOS-take-home
//
//  Created by William Reed on 11/1/23.
//
//  API Endpoint 1 -- Create list that displays dessert recipes in alphabetical order

import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 100, height: 70)
                .background(Color.gray)
                
        }
        else{
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data,
            _, _ in self.data = data
        }
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @StateObject var dessertDetails = DessertDetails()
    
    var body: some View {
        ZStack {
            NavigationView {
                        List {
                            ForEach(viewModel.desserts.values.sorted(by: { $0.strMeal < $1.strMeal }), id: \.idMeal) { dessert in
                                NavigationLink(destination: DessertDetail(dessertDetails: dessertDetails, idMeal: dessert.idMeal)) {
                                    HStack {
                                        URLImage(urlString: dessert.strMealThumb)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 130, height: 70)

                                        Text(dessert.strMeal)
                                            .bold()
                                            
                                    }
                                }
                                .padding(3)
                            }
                        }
                        .navigationTitle("Desserts")
                        .onAppear {
                            viewModel.fetch()
                        }
            }
        }
        
    }
}


struct DessertDetail: View {
    @ObservedObject var dessertDetails: DessertDetails
    let idMeal: String
    
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                    if let details = dessertDetails.details {
                        Text(details.strMeal)
                            .bold()
                            .multilineTextAlignment(.center)
                            .fontWeight(.light)
                            .font(.title)
                            .padding(75)
                        Spacer()
                        
                        Text("Ingredients")
                            .bold()
                            .font(.title2)
                        
                        if let ingredient1 = details.strIngredient1,
                           !ingredient1.isEmpty,
                           let measurement1 = details.strMeasure1,
                           !measurement1.isEmpty {
                            Text("\(ingredient1): \(measurement1)")
                                .multilineTextAlignment(.center)
                                
                        }
                        
                        if let ingredient2 = details.strIngredient2,
                           !ingredient2.isEmpty,
                           let measurement2 = details.strMeasure2,
                           !measurement2.isEmpty {
                            Text("\(ingredient2): \(measurement2)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient3 = details.strIngredient3,
                           !ingredient3.isEmpty,
                           let measurement3 = details.strMeasure3,
                           !measurement3.isEmpty {
                            Text("\(ingredient3): \(measurement3)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient4 = details.strIngredient4,
                           !ingredient4.isEmpty,
                           let measurement4 = details.strMeasure4,
                           !measurement4.isEmpty {
                            Text("\(ingredient4): \(measurement4)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient5 = details.strIngredient5,
                           !ingredient5.isEmpty,
                           let measurement5 = details.strMeasure5,
                           !measurement5.isEmpty {
                            Text("\(ingredient5): \(measurement5)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient6 = details.strIngredient6,
                           !ingredient6.isEmpty,
                           let measurement6 = details.strMeasure6,
                           !measurement6.isEmpty {
                            Text("\(ingredient6): \(measurement6)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient7 = details.strIngredient7,
                           !ingredient7.isEmpty,
                           let measurement7 = details.strMeasure7,
                           !measurement7.isEmpty {
                            Text("\(ingredient7): \(measurement7)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient8 = details.strIngredient8,
                           !ingredient8.isEmpty,
                           let measurement8 = details.strMeasure8,
                           !measurement8.isEmpty {
                            Text("\(ingredient8): \(measurement8)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient9 = details.strIngredient9,
                           !ingredient9.isEmpty,
                           let measurement9 = details.strMeasure9,
                           !measurement9.isEmpty {
                            Text("\(ingredient9): \(measurement9)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient10 = details.strIngredient10,
                           !ingredient10.isEmpty,
                           let measurement10 = details.strMeasure10,
                           !measurement10.isEmpty {
                            Text("\(ingredient10): \(measurement10)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient11 = details.strIngredient11,
                           !ingredient11.isEmpty,
                           let measurement11 = details.strMeasure11,
                           !measurement11.isEmpty {
                            Text("\(ingredient11): \(measurement11)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient12 = details.strIngredient12,
                           !ingredient12.isEmpty,
                           let measurement12 = details.strMeasure12,
                           !measurement12.isEmpty {
                            Text("\(ingredient12): \(measurement12)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient13 = details.strIngredient13,
                           !ingredient13.isEmpty,
                           let measurement13 = details.strMeasure13,
                           !measurement13.isEmpty {
                            Text("\(ingredient13): \(measurement13)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient14 = details.strIngredient14,
                           !ingredient14.isEmpty,
                           let measurement14 = details.strMeasure14,
                           !measurement14.isEmpty {
                            Text("\(ingredient14): \(measurement14)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient15 = details.strIngredient15,
                           !ingredient15.isEmpty,
                           let measurement15 = details.strMeasure15,
                           !measurement15.isEmpty {
                            Text("\(ingredient15): \(measurement15)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient16 = details.strIngredient16,
                           !ingredient16.isEmpty,
                           let measurement16 = details.strMeasure16,
                           !measurement16.isEmpty {
                            Text("\(ingredient16): \(measurement16)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient17 = details.strIngredient17,
                           !ingredient17.isEmpty,
                           let measurement17 = details.strMeasure17,
                           !measurement17.isEmpty {
                            Text("\(ingredient17): \(measurement17)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient18 = details.strIngredient18,
                           !ingredient18.isEmpty,
                           let measurement18 = details.strMeasure18,
                           !measurement18.isEmpty {
                            Text("\(ingredient18): \(measurement18)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient19 = details.strIngredient19,
                           !ingredient19.isEmpty,
                           let measurement19 = details.strMeasure19,
                           !measurement19.isEmpty {
                            Text("\(ingredient19): \(measurement19)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let ingredient20 = details.strIngredient20,
                           !ingredient20.isEmpty,
                           let measurement20 = details.strMeasure20,
                           !measurement20.isEmpty {
                            Text("\(ingredient20): \(measurement20)")
                                .multilineTextAlignment(.leading)
                        }
                            
                        Spacer(minLength: 50)
                        Text("Instructions")
                            .bold()
                            .font(.title2)
                        
                        Text("\(details.strInstructions)")
                            .padding(50)
                        
                        
                        //createIngredientViews(details: details)
                    }
                    else {
                        Text("Loading...")
                    }
                }
                .onAppear {
                    dessertDetails.fetchDetails(forMealID: idMeal)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
