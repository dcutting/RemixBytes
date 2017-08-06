//  Copyright © 2017 cutting.io. All rights reserved.

class GamePanelCoordinator {

    private var gamePanelView: GamePanelViewController?
    private let pickGameViewFactory = PickGameViewControllerFactory()
    private let pickNumberViewFactory = PickNumberContinuousViewControllerFactory()
    private let playGameViewFactory = PlayGameContinuousViewControllerFactory()
    private let gameInteractor = GameInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private var playGameView: PlayGameView?

    func start(window: WindowWireframe) {
        gamePanelView = GamePanelViewControllerFactory().make()
        window.rootView = gamePanelView

        showPanel()
        updatePlayGameView()
    }

    private func showPanel() {
        loadPickGameView()
        loadPickNumberView()
        loadPlayGameView()
    }

    private func loadPickGameView() {
        var view = pickGameViewFactory.make()
        view.delegate = self
        gamePanelView?.topLeft = view
    }

    private func loadPickNumberView() {
        var view = pickNumberViewFactory.make()
        view.delegate = self
        gamePanelView?.bottomLeft = view
    }

    private func loadPlayGameView() {
        let view = playGameViewFactory.make()
        gamePanelView?.right = view
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
