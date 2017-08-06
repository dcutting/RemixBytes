//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gameCoordinator: Any?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        start(window: window)

        window.makeKeyAndVisible()
        return true
    }

    private func start(window: UIWindow) {
        
        if UI_USER_INTERFACE_IDIOM() == .pad {
            let coordinator = GamePanelCoordinator()
            coordinator.start(window: window)
            gameCoordinator = coordinator
        } else {
            let coordinator = GameCoordinator()
            coordinator.start(window: window)
            gameCoordinator = coordinator
        }
    }
}
