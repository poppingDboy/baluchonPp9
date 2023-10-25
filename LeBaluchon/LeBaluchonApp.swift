//
//  LeBaluchonApp.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 29/08/2023.
//

import SwiftUI

@main
struct LeBaluchonApp: App {
    
    func storageExemple() {
        let myValueString = UserDefaults.standard.string(forKey: "myValue")
        UserDefaults.standard.setValue("tototo", forKey: "myValue")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
