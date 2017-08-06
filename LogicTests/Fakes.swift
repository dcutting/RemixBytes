//  Copyright © 2017 cutting.io. All rights reserved.



/* Fake views. */

class FakePickGameView: PickGameView {

    var delegate: PickGameViewDelegate?
}

class FakePickNumberView: PickNumberView {

    var delegate: PickNumberViewDelegate?
}

class FakePlayGameView: PlayGameView {

    var delegate: PlayGameViewDelegate?
    var viewData: PlayGameViewData?
}



/* Fake view factories. */

class FakePickGameViewFactory: PickGameViewFactory {

    let fake: PickGameView

    init(fake: PickGameView) {
        self.fake = fake
    }

    func make() -> PickGameView {
        return fake
    }
}

class FakePickNumberViewFactory: PickNumberViewFactory {

    let fake: PickNumberView

    init(fake: PickNumberView) {
        self.fake = fake
    }

    func make() -> PickNumberView {
        return fake
    }
}

class FakePlayGameViewFactory: PlayGameViewFactory {

    let fake: PlayGameView

    init(fake: PlayGameView) {
        self.fake = fake
    }

    func make() -> PlayGameView {
        return fake
    }
}



/* Fake window. */

class FakeWindowWireframe: WindowWireframe {

    var rootView: Viewable?
}
