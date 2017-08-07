//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GameCoordinator {

    private let window: UIWindow
    private let pickGameViewFactory = PickGameViewControllerFactory()
    private let pickNumberViewFactory = PickNumberViewControllerFactory()
    private let playGameViewFactory = PlayGameViewControllerFactory()
    private let gameInteractor = GameInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private var playGameView: PlayGameView?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showStartView()
    }

    private func showStartView() {
        showPickGameView()
    }
}

extension GameCoordinator: PickGameViewDelegate {

    private func showPickGameView() {
        let pickGameView = pickGameViewFactory.make()
        pickGameView.delegate = self
        show(view: pickGameView)
    }

    func didPickPrime() {
        gameInteractor.pickPrime()
        finishPickGame()
    }

    func didPickSpelledOut() {
        gameInteractor.pickSpelledOut()
        finishPickGame()
    }

    private func finishPickGame() {
        showPickNumberView()
    }
}

extension GameCoordinator: PickNumberViewDelegate {

    private func showPickNumberView() {
        let pickNumberView = pickNumberViewFactory.make()
        pickNumberView.delegate = self
        show(view: pickNumberView)
    }

    func didPick(number: Int) {
        gameInteractor.pick(number: number)
        finishPickNumber()
    }

    private func finishPickNumber() {
        showPlayGameView()
    }
}

extension GameCoordinator: PlayGameViewDelegate {

    private func showPlayGameView() {
        let playGameView = playGameViewFactory.make()
        playGameView.delegate = self
        self.playGameView = playGameView
        show(view: playGameView)

        playGame()
    }

    func didTapOK() {
        finishPlayGame()
    }

    private func finishPlayGame() {
        playGameView = nil
        showStartView()
    }
}

extension GameCoordinator {

    private func playGame() {
        let result = gameInteractor.findGameResult()
        let viewData = playGameFormatter.prepare(result: result)
        playGameView?.viewData = viewData
    }
}

extension GameCoordinator {

    private func show(view: Viewable) {
        window.rootViewController = view.viewController
    }
}
