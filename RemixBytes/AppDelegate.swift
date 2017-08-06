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
        if UI_USER_INTERFACE_IDIOM() == .pad {
            let coordinator = GamePanelCoordinator(
                window: window,
                gamePanelViewFactory: GamePanelViewControllerFactory(),
                pickGameViewFactory: PickGameViewControllerFactory(),
                pickNumberViewFactory: PickNumberContinuousViewControllerFactory(),
                playGameViewFactory: PlayGameContinuousViewControllerFactory()
            )
            coordinator.start()
            self.coordinator = coordinator
        } else {
            let coordinator = GameCoordinator(
                window: window,
                pickFeature: makePickFeature(),
                playGameViewFactory: PlayGameViewControllerFactory()
            )
            coordinator.start()
            self.coordinator = coordinator
        }
    }

    private func makePickFeature() -> PickFeature {
        return PickFeature(
            pickGameViewFactory: PickGameViewControllerFactory(),
            pickNumberViewFactory: PickNumberViewControllerFactory()
        )
    }
}
