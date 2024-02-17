//
//  ContentView.swift
//  Volume App
//
//  Created by Vinoth Vino on 16/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    @State private var showRover = false
    
    var body: some View {
        VStack {
            Toggle("Show LunarRover 3D Model", isOn: $showRover)
                .toggleStyle(.button)
        }
        .onChange(of: showRover) { _, newValue in
            if newValue {
                openWindow(id: "3DModelViewer")
            } else {
                dismissWindow(id: "3DModelViewer")
            }
        }
    }
}

struct ModelViewer: View {
    var body: some View {
        RealityView { content in
            guard let roverEntity = try? await Entity(named: "LunarRover") else { return }
            roverEntity.transform.translation = [-0.1, -0.48, 0.2]
            
            guard let roverAnimation = roverEntity.availableAnimations.first else { return }
            roverEntity.playAnimation(roverAnimation)
            
            content.add(roverEntity)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
