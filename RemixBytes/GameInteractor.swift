//  Copyright © 2017 cutting.io. All rights reserved.

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

class GameInteractor {

    private var game = Game.none
    private var number = 0

    func pickPrime() {
        game = .prime
    }

    func pickSpelledOut() {
        game = .spelledOut
    }

    func pick(number: Int) {
        self.number = number
    }

    func playGame() -> GameResult {

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
}
