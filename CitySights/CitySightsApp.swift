//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Salima O. on 16/07/2022.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
