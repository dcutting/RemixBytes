//  Copyright © 2017 cutting.io. All rights reserved.

protocol PickGameViewFactory {
    func make() -> PickGameView
}

protocol PickGameViewDelegate: class {
    func didPickSpelledOut()
    func didPickPrime()
}

protocol PickGameView: Viewable {
    weak var delegate: PickGameViewDelegate? { get set }
}
