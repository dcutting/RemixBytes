//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GamePanelCoordinator {

    private var container: GamePanelContainer?
    private let pickGameViewFactory = PickGameViewFactory()
    private let pickNumberViewFactory = PickNumberViewFactory()
    private let playGameViewFactory = PlayGameViewFactory()
    private let gameInteractor = GameInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private var playGameView: PlayGameViewController?

    func start(window: UIWindow) {
        container = GamePanelContainerFactory().make()
        window.rootViewController = container

        showPanel()
        updatePlayGameView()
    }

    private func showPanel() {
        loadPickGameView()
        loadPickNumberView()
        loadPlayGameView()
    }

    private func loadPickGameView() {
        let view = pickGameViewFactory.make()
        view.delegate = self
        container?.topLeft = view
    }

    private func loadPickNumberView() {
        let view = pickNumberViewFactory.make()
        view.delegate = self
        container?.bottomLeft = view
    }

    private func loadPlayGameView() {
        let view = playGameViewFactory.make()
        container?.right = view
        self.playGameView = view
    }

    private func updatePlayGameView() {
        let result = gameInteractor.findGameResult()
        playGameView?.viewData = playGameFormatter.prepare(result: result)
    }
}

extension GamePanelCoordinator: PickGameViewDelegate {

    func didPickSpelledOut() {
        gameInteractor.pickSpelledOut()
        updatePlayGameView()
    }

    func didPickPrime() {
        gameInteractor.pickPrime()
        updatePlayGameView()
    }
}

extension GamePanelCoordinator: PickNumberViewDelegate {

    func didPick(number: Int) {
        gameInteractor.pick(number: number)
        updatePlayGameView()
    }
}
