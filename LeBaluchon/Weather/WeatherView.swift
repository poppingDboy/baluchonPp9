//
//  WeatherView.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 12/09/2023.
//

import AVKit
import SwiftUI

struct WeatherView: View {
    private let player: AVPlayer = {
        let player = AVPlayer(url: Bundle.main.url(forResource: "rain", withExtension: "mp4")!)
        player.isMuted = true // Désactiver le son de la vidéo
        return player
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
            
            /// Header
            HStack(alignment: .center) {
                Button {
                    print("coucou")
                } label: {
                    Label("", systemImage: "folder")
                }
                
                Spacer()
                Text("Météo")
                Spacer()
                
                Image(systemName: "star")
            }
            .padding(10)
            .background(CustomColor.greySmoke)
            .foregroundColor(.white)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
