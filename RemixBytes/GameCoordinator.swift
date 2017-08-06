//  Copyright © 2017 cutting.io. All rights reserved.

class GameCoordinator {

    private let window: WindowWireframe
    private let pickFeature: PickFeature
    private let playGameViewFactory: PlayGameViewFactory
    private let interactor = LocalPlayInteractor()
    private let playGameFormatter = PlayGameFormatter()

    private var pickCoordinator: PickCoordinator?
    private var playGameView: PlayGameView?

    init(window: WindowWireframe, pickFeature: PickFeature, playGameViewFactory: PlayGameViewFactory) {
        self.window = window
        self.pickFeature = pickFeature
        self.playGameViewFactory = playGameViewFactory
    }

    func start() {
        showStartView()
    }

    private func showStartView() {
        startPickFeature()
    }
}

extension GameCoordinator: PickCoordinatorDelegate {

    private func startPickFeature() {
        pickCoordinator = pickFeature.makeCoordinator()
        pickCoordinator?.delegate = self
        pickCoordinator?.start(window: window)
    }

    func didPick(result: PickInteractorResult) {
        interactor.pick(pick: result)
        finishPickFeature()
    }

    private func finishPickFeature() {
        pickCoordinator = nil
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
        let result = interactor.findGameResult()
        let viewData = playGameFormatter.prepare(result: result)
        playGameView?.viewData = viewData
    }
}

extension GameCoordinator {

    private func show(view: Viewable) {
        window.rootView = view
    }
}
