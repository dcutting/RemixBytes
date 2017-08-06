//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

enum Game {
    case spelledOut
    case prime
}

class GameCoordinator {

    private var window: UIWindow?

    private var game: Game?
    private var number: Int?

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

extension GameCoordinator: PickNumberViewControllerDelegate {

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

extension GameCoordinator: PlayGameViewControllerDelegate {

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
        guard let game = game else { return }

        let result: String
        switch game {
        case .spelledOut:
            result = spelledOutText()
        case .prime:
            result = primeText()
        }

        playGameView?.viewData = PlayGameViewData(result: result)
    }

    private func spelledOutText() -> String {
        guard let number = number else { return "" }

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(for: number) ?? ""
    }

    private func primeText() -> String {
        guard let number = number else { return "" }

        let n = Int(number)
        let result = isPrime(n: n)
        return result ? "\(n) is prime\n🤓" : "\(n) is not prime\n😔"
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
}

extension GameCoordinator {

    private func show(view: UIViewController) {
        window?.rootViewController = view
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
