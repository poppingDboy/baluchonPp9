//
//  CurrencyView.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 12/09/2023.
//

import SwiftUI

struct CurrencyView: View {
    @ObservedObject var viewModel = CurrencyViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Entrée")) {
                    TextField("Montant", text: $viewModel.inputAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Monnaie d'entrée", selection: $viewModel.inputCurrency) {
                        ForEach(CurrencyViewModel.Currency.allCases, id: \.self) { currency in
                            Text(currency.displayName)
                        }
                        //.id(UUID()) // Forcer la mise à jour lorsque l'élément est sélectionné
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Sortie")) {
                    Text("Monnaie Convertit")
                        .font(.headline)
                    
                    Text("\(viewModel.outputAmount)")
                        .font(.largeTitle)
                    
                    Picker("Monnaie de retour", selection: $viewModel.outputCurrency) {
                        ForEach(CurrencyViewModel.Currency.allCases, id: \.self) { currency in
                            Text(currency.displayName)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Button(action: {
                    viewModel.fetchCurrency()
                }) {
                    Text("CONVERTIR")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                if viewModel.fixerRates != [:] {
                    Text("Success")
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                }
                
            }
            .navigationBarTitle("Convertisseur")
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
