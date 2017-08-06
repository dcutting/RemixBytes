//  Copyright © 2017 cutting.io. All rights reserved.

enum PickInteractorResult {
    case none
    case spelledOut(Int)
    case prime(Int)
}

class PickInteractor {

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

    func result() -> PickInteractorResult {
        switch game {
        case .none:
            return .none
        case .spelledOut:
            return .spelledOut(number)
        case .prime:
            return .prime(number)
        }
    }
}
