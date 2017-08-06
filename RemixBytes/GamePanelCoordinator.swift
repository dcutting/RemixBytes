//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GamePanelCoordinator {

    private let pickGameViewFactory = PickGameViewControllerFactory()
    private let pickNumberViewFactory = PickNumberContinuousViewControllerFactory()
    private let playGameViewFactory = PlayGameContinuousViewControllerFactory()
    private let gameInteractor = GameInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private let gamePanelView: GamePanelViewController
    private var playGameView: PlayGameView?

    init(window: UIWindow) {
        gamePanelView = GamePanelViewControllerFactory().make()
        window.rootViewController = gamePanelView
    }

    func start() {
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
        gamePanelView.topLeft = view
    }

    private func loadPickNumberView() {
        let view = pickNumberViewFactory.make()
        view.delegate = self
        gamePanelView.bottomLeft = view
    }

    private func loadPlayGameView() {
        let view = playGameViewFactory.make()
        gamePanelView.right = view
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
