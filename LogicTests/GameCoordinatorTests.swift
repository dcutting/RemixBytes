//  Copyright © 2017 cutting.io. All rights reserved.

import XCTest

class GameCoordinatorTests: XCTestCase {

    var pickGameView: PickGameView!
    var pickNumberView: PickNumberView!
    var playGameView: PlayGameView!

    var fakePickGameViewFactory: FakePickGameViewFactory!
    var fakePickNumberViewFactory: FakePickNumberViewFactory!
    var fakePlayGameViewFactory: FakePlayGameViewFactory!

    var window: FakeWindowWireframe!

    var coordinator: GameCoordinator!

    override func setUp() {

        pickGameView = FakePickGameView()
        pickNumberView = FakePickNumberView()
        playGameView = FakePlayGameView()

        fakePickGameViewFactory = FakePickGameViewFactory(fake: pickGameView)
        fakePickNumberViewFactory = FakePickNumberViewFactory(fake: pickNumberView)
        fakePlayGameViewFactory = FakePlayGameViewFactory(fake: playGameView)

        let pickFeature = PickFeature(
            pickGameViewFactory: fakePickGameViewFactory,
            pickNumberViewFactory: fakePickNumberViewFactory
        )

        window = FakeWindowWireframe()

        coordinator = GameCoordinator(
            window: window,
            pickFeature: pickFeature,
            playGameViewFactory: fakePlayGameViewFactory
        )
    }
    
    func test_primeFlow() {

        coordinator.start()

        XCTAssertTrue(pickGameView === window.rootView)

        pickGameView.delegate?.didPickPrime()

        XCTAssertTrue(pickNumberView === window.rootView)

        pickNumberView.delegate?.didPick(number: 7)

        XCTAssertTrue(playGameView === window.rootView)

        let actual = playGameView.viewData?.outputText
        let expected = "7 is prime\n🤓"
        XCTAssertEqual(expected, actual)

        playGameView.delegate?.didTapOK()

        XCTAssertTrue(pickGameView === window.rootView)
    }
}
