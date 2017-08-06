//  Copyright © 2017 cutting.io. All rights reserved.

enum Game {
    case none
    case spelledOut
    case prime
}

class LocalPlayInteractor {

    private var pick = PickInteractorResult.none

    func pick(pick: PickInteractorResult) {
        self.pick = pick
    }

    func findGameResult() -> GameResult {
        switch pick {
        case .none:
            return .none
        case let .spelledOut(number):
            return .spelledOut(number)
        case let .prime(number):
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
