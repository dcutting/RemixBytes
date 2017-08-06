//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GameCoordinator {

    private var window: UIWindow?
    private let pickGameViewFactory = PickGameViewFactory()
    private let pickNumberViewFactory = PickNumberViewFactory()
    private let playGameViewFactory = PlayGameViewFactory()
    private let gameInteractor = GameInteractor()

    private var playGameView: PlayGameViewController?

    func start(window: UIWindow) {
        self.window = window

        showStartView()
    }

    private func showStartView() {
        showPickGameView()
    }
}

extension GameCoordinator: PickGameViewControllerDelegate {

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

extension GameCoordinator: PickNumberViewControllerDelegate {

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

extension GameCoordinator: PlayGameViewControllerDelegate {

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
        let viewData = prepare(result: result)
        playGameView?.viewData = viewData
    }

    private func prepare(result: GameResult) -> PlayGameViewData {
        let outputText: String
        switch result {
        case .none:
            outputText = ""
        case let .spelledOut(number):
            outputText = spelledOutText(number: number)
        case let .prime(number, isPrime):
            outputText = primeText(number: number, isPrime: isPrime)
        }
        return PlayGameViewData(outputText: outputText)
    }

    private func spelledOutText(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(for: number) ?? ""
    }

    private func primeText(number: Int, isPrime: Bool) -> String {
        return isPrime ? "\(number) is prime\n🤓" : "\(number) is not prime\n😔"
    }
}

extension GameCoordinator {

    private func show(view: UIViewController) {
        window?.rootViewController = view
    }
}
