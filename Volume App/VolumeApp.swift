//
//  VolumeApp.swift
//  Volume App
//
//  Created by Vinoth Vino on 16/02/24.
//

import SwiftUI

@main
struct VolumeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 300, height: 300)
        
        WindowGroup(id: "3DModelViewer") {
            ModelViewer()
        }
        .windowStyle(.volumetric)
    }
}
