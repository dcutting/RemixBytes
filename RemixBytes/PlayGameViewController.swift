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

class PlayGameViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var game = Game.none
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        playGame()
    }

    private func playGame() {
        let result = findGameResult()
        let outputText = prepare(result: result)
        outputLabel.text = outputText
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

    private func prepare(result: GameResult) -> String {
        let outputText: String
        switch result {
        case .none:
            outputText = ""
        case let .spelledOut(number):
            outputText = spelledOutText(number: number)
        case let .prime(number, isPrime):
            outputText = primeText(number: number, isPrime: isPrime)
        }
        return outputText
    }

    private func spelledOutText(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(for: number) ?? ""
    }

    private func primeText(number: Int, isPrime: Bool) -> String {
        return isPrime ? "\(number) is prime\n🤓" : "\(number) is not prime\n😔"
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
