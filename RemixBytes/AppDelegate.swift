//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var gameCoordinator: GameCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        window.backgroundColor = .white

        gameCoordinator = GameCoordinator()
        gameCoordinator?.start(window: window)

        window.makeKeyAndVisible()

        return true
    }
}
