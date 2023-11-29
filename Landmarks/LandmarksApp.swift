//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by samgu.lee on 21/11/23.
//

import SwiftUI
import Sentry


@main
struct LandmarksApp: App {
    init() {
        SentrySDK.start { options in
            options.dsn = "https://157f7d3993daa543eef9cb08bb506c6b@o299485.ingest.sentry.io/4506308928536576"
            options.debug = true // Enabled debug when first installing is always helpful
            options.enableTracing = true 

            // Uncomment the following lines to add more data to your events
            // options.attachScreenshot = true // This adds a screenshot to the error events
            // options.attachViewHierarchy = true // This adds the view hierarchy to the error events
        }
        // Remove the next line after confirming that your Sentry integration is working.
        SentrySDK.capture(message: "This app uses Sentry! :)")
    }
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    modelData
                )
        }
        #if !os(watchOS)
            .commands {
                LandmarkCommands()
            }
        #endif

        #if os(watchOS)
            WKNotificationScene(
                controller: NotificationController.self,
                category: "LandmarkNear"
            )
        #endif

        #if os(macOS)
            Settings {
                LandmarkSettings()
            }
        #endif
    }
}
