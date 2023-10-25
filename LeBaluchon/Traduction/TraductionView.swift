//
//  TraductionView.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 29/08/2023.
//

import SwiftUI

struct TraductionView: View {
    @ObservedObject var viewModel = TraductionViewModel()
    
    @State private var txtToChange: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            /// Header
            HStack(alignment: .center){
                Image(systemName: "apple.logo")
                Spacer()
                Text("Traducteur")
                Spacer()
                Image(systemName: "questionmark.circle.fill")
                
            }
            .padding(10)
            .background(CustomColor.greySmoke)
            .foregroundColor(.white)
            
            /// Divider
            Divider()
                .frame(height: 2)
                .background(CustomColor.greenMenthol)
            
            /// Langage Bar
            HStack(alignment: .center){
                Text("Français")
                Spacer()
                Button {
                    print("Échange de langue")
                } label: {
                    Image(systemName: "arrow.left.arrow.right.circle.fill")
                }
                .foregroundColor(CustomColor.blackDark)
                Spacer()
                Text("Anglais")
            }
            .padding(10)
            .background(Color.white)
            .foregroundColor(CustomColor.blackDark)
            
            /// Divider
            Divider()
                .frame(height: 2)
                .background(CustomColor.greenMenthol)
            
            /// Texte à traduire
            HStack(){
                TextField("Saisissez ou collez votre texte ici pour le traduire", text: $txtToChange)
            }
            .padding(.bottom, 140)
            
            /// Divider
            Divider()
                .frame(height: 2)
                .background(CustomColor.greenMenthol)
            
            /// Texte à traduire
            HStack(){
                Text("\(txtToChange)")
            }
            .padding(.bottom, 140)
            
            /// Divider
            Divider()
                .frame(height: 2)
                .background(CustomColor.greenMenthol)
            
            
            Spacer()
            
            Button(action: {
                viewModel.fetchTraduction()
            }) {
                Text("Fetch Traduction")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
//            if let traductionResponse = viewModel.traductionResponse {
//                Text("Success")
//            } else if let error = viewModel.error {
//                Text("Error: \(error.localizedDescription)")
//            }
            
        }
        
        
    }
}

struct TraductionView_Previews: PreviewProvider {
    static var previews: some View {
        TraductionView()
    }
}
