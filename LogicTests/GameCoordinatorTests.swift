//  Copyright © 2017 cutting.io. All rights reserved.

import XCTest

class GameCoordinatorTests: XCTestCase {

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

        let pickFeature = PickFeature(
            pickGameViewFactory: fakePickGameViewFactory,
            pickNumberViewFactory: fakePickNumberViewFactory
        )

        coordinator = GameCoordinator(
            pickFeature: pickFeature,
            playGameViewFactory: fakePlayGameViewFactory
        )

        fakeWindow = FakeWindowWireframe()
    }
    
    func test_primeFlow() {

        coordinator.start(window: fakeWindow)

        XCTAssertTrue(fakePickGameView === fakeWindow.rootView)

        fakePickGameView.delegate?.didPickPrime()

        XCTAssertTrue(fakePickNumberView === fakeWindow.rootView)

        fakePickNumberView.delegate?.didPick(number: 7)

        let actual = fakePlayGameView.viewData?.outputText
        let expected = "7 is prime\n🤓"
        XCTAssertEqual(expected, actual)

        fakePlayGameView.delegate?.didTapOK()

        XCTAssertTrue(fakePickGameView === fakeWindow.rootView)
    }
}
