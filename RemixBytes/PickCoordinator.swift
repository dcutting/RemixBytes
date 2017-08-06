//  Copyright © 2017 cutting.io. All rights reserved.

protocol PickCoordinatorDelegate: class {
    func didPick(result: PickInteractorResult)
}

class PickCoordinator {

    weak var delegate: PickCoordinatorDelegate?

    private var window: WindowWireframe?
    private let pickGameViewFactory: PickGameViewFactory
    private let pickNumberViewFactory: PickNumberViewFactory
    private let interactor = PickInteractor()

    init(pickGameViewFactory: PickGameViewFactory, pickNumberViewFactory: PickNumberViewFactory) {
        self.pickGameViewFactory = pickGameViewFactory
        self.pickNumberViewFactory = pickNumberViewFactory
    }

    func start(window: WindowWireframe) {
        self.window = window

        showStartView()
    }

    private func showStartView() {
        showPickGameView()
    }
}

extension PickCoordinator: PickGameViewDelegate {

    private func showPickGameView() {
        let pickGameView = pickGameViewFactory.make()
        pickGameView.delegate = self
        show(view: pickGameView)
    }

    func didPickPrime() {
        interactor.pickPrime()
        finishPickGame()
    }

    func didPickSpelledOut() {
        interactor.pickSpelledOut()
        finishPickGame()
    }

    private func finishPickGame() {
        showPickNumberView()
    }
}

extension PickCoordinator: PickNumberViewDelegate {

    private func showPickNumberView() {
        let pickNumberView = pickNumberViewFactory.make()
        pickNumberView.delegate = self
        show(view: pickNumberView)
    }

    func didPick(number: Int) {
        interactor.pick(number: number)
        finishPickNumber()
    }

    private func finishPickNumber() {
        let result = interactor.result()
        delegate?.didPick(result: result)
    }
}

extension PickCoordinator {

    private func show(view: Viewable) {
        window?.rootView = view
    }
}
