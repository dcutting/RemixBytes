//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

enum Game {
    case none
    case spelledOut
    case prime
}

enum GameResult {
    case none
    case spelledOut(Int)
    case prime(Int, Bool)
}

class GameCoordinator {

    private let window: UIWindow

    private var game = Game.none
    private var number = 0

    private var playGameView: PlayGameViewController?

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
        let pickGameView = makePickGameView()
        pickGameView.delegate = self
        show(view: pickGameView)
    }

    func didPickPrime() {
        game = .prime
        finishPickGame()
    }

    func didPickSpelledOut() {
        game = .spelledOut
        finishPickGame()
    }

    private func finishPickGame() {
        showPickNumberView()
    }
}

extension GameCoordinator: PickNumberViewDelegate {

    private func showPickNumberView() {
        let pickNumberView = makePickNumberView()
        pickNumberView.delegate = self
        show(view: pickNumberView)
    }

    func didPick(number: Int) {
        self.number = number
        finishPickNumber()
    }

    private func finishPickNumber() {
        showPlayGameView()
    }
}

extension GameCoordinator: PlayGameViewDelegate {

    private func showPlayGameView() {
        let playGameView = makePlayGameView()
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
        let result = findGameResult()
        let viewData = prepare(result: result)
        playGameView?.viewData = viewData
    }

    private func findGameResult() -> GameResult {
        switch game {
        case .none:
            return .none
        case .spelledOut:
            return .spelledOut(number)
        case .prime:
            return .prime(number, isPrime(n: number))
        }
    }

    private func isPrime(n: Int) -> Bool {
        guard n > 1 else { return false }
        guard n > 3 else { return true }
        guard n % 2 != 0, n % 3 != 0 else { return false }
        var i = 5
        while i * i <= n {
            guard n % i != 0, n % (i + 2) != 0 else { return false }
            i += 6
        }
        return true
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
        return PlayGameViewData(result: outputText)
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
        window.rootViewController = view
    }

    private func makePickGameView() -> PickGameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickGameViewController") as! PickGameViewController
    }

    private func makePickNumberView() -> PickNumberViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickNumberViewController") as! PickNumberViewController
    }

    private func makePlayGameView() -> PlayGameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
    }
}
