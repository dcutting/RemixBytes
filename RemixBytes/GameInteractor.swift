//  Copyright © 2017 cutting.io. All rights reserved.

enum GameResult {
    case none
    case spelledOut(Int)
    case prime(Int, Bool)
}

class GameInteractor {

    let pickInteractor = PickInteractor()
    let localPlayInteractor = LocalPlayInteractor()

    func pickPrime() {
        pickInteractor.pickPrime()
    }

    func pickSpelledOut() {
        pickInteractor.pickSpelledOut()
    }

    func pick(number: Int) {
        pickInteractor.pick(number: number)
    }

    func findGameResult() -> GameResult {
        let pickResult = pickInteractor.result()
        localPlayInteractor.pick(pick: pickResult)
        return localPlayInteractor.findGameResult()
    }
}
