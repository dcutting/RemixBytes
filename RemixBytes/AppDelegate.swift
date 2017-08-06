//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Any?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        start(window: window)

        window.makeKeyAndVisible()
        return true
    }

    private func start(window: UIWindow) {
        let coordinator = GameCoordinator()
        coordinator.start(window: window)
        self.coordinator = coordinator
    }
}
