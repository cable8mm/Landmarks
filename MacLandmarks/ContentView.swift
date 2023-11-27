//
//  ContentView.swift
//  MacLandmarks
//
//  Created by samgu.lee on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
