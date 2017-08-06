//  Copyright © 2017 cutting.io. All rights reserved.

class GamePanelCoordinator {

    private let gamePanelViewFactory: GamePanelViewFactory
    private let pickGameViewFactory: PickGameViewFactory
    private let pickNumberViewFactory: PickNumberViewFactory
    private let playGameViewFactory: PlayGameViewFactory
    private let gameInteractor = GameInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private var gamePanelView: GamePanelView?
    private var playGameView: PlayGameView?

    init(gamePanelViewFactory: GamePanelViewFactory, pickGameViewFactory: PickGameViewFactory, pickNumberViewFactory: PickNumberViewFactory, playGameViewFactory: PlayGameViewFactory) {
        self.gamePanelViewFactory = gamePanelViewFactory
        self.pickGameViewFactory = pickGameViewFactory
        self.pickNumberViewFactory = pickNumberViewFactory
        self.playGameViewFactory = playGameViewFactory
    }

    func start(window: WindowWireframe) {
        gamePanelView = gamePanelViewFactory.make()
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
        let view = pickGameViewFactory.make()
        view.delegate = self
        gamePanelView?.topLeft = view
    }

    private func loadPickNumberView() {
        let view = pickNumberViewFactory.make()
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
