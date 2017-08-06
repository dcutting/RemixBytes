//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GamePanelCoordinator {

    private var container: GamePanelContainer?
    private let pickGameViewFactory = PickGameViewFactory()
    private let pickNumberViewFactory = PickNumberViewFactory()
    private let playGameViewFactory = PlayGameViewFactory()

    func start(window: UIWindow) {
        container = GamePanelContainerFactory().make()
        window.rootViewController = container

        showPanel()
    }

    private func showPanel() {
        loadPickGameView()
        loadPickNumberView()
        loadPlayGameView()
    }

    private func loadPickGameView() {
        let view = pickGameViewFactory.make()
        container?.topLeft = view
    }

    private func loadPickNumberView() {
        let view = pickNumberViewFactory.make()
        container?.bottomLeft = view
    }

    private func loadPlayGameView() {
        let view = playGameViewFactory.make()
        container?.right = view
    }
}
