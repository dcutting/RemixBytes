//  Copyright © 2017 cutting.io. All rights reserved.

import XCTest

class LogicTests: XCTestCase {

    var fakePickGameView: PickGameView!
    var fakePickNumberView: PickNumberView!
    var fakePlayGameView: PlayGameView!

    var fakePickGameViewFactory: FakePickGameViewFactory!
    var fakePickNumberViewFactory: FakePickNumberViewFactory!
    var fakePlayGameViewFactory: FakePlayGameViewFactory!

    var fakeWindow: FakeWindowWireframe!

    var coordinator: GameCoordinator!

    override func setUp() {

        fakePickGameView = FakePickGameView()
        fakePickNumberView = FakePickNumberView()
        fakePlayGameView = FakePlayGameView()

        fakePickGameViewFactory = FakePickGameViewFactory(fake: fakePickGameView)
        fakePickNumberViewFactory = FakePickNumberViewFactory(fake: fakePickNumberView)
        fakePlayGameViewFactory = FakePlayGameViewFactory(fake: fakePlayGameView)

        coordinator = GameCoordinator(
            pickGameViewFactory: fakePickGameViewFactory,
            pickNumberViewFactory: fakePickNumberViewFactory,
            playGameViewFactory: fakePlayGameViewFactory
        )

        fakeWindow = FakeWindowWireframe()
    }
    
    func test_primeFlow() {

        coordinator.start(window: fakeWindow)

        XCTAssertEqual(fakePickGameView, fakeWindow.rootView)

        fakePickGameView.delegate?.didPickPrime()

        XCTAssertEqual(fakePickNumberView, fakeWindow.rootView)

        fakePickNumberView.delegate?.didPick(number: 7)

        let actual = fakePlayGameView.viewData
        let expected = "7 is prime\n🤓"
        XCTAssertEqual(expected, actual?.outputText)

        fakePlayGameView.delegate?.didTapOK()

        XCTAssertEqual(fakePickGameView, fakeWindow.rootView)
    }
}
