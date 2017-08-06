//  Copyright © 2017 cutting.io. All rights reserved.

class PickFeature {

    private let pickGameViewFactory: PickGameViewFactory
    private let pickNumberViewFactory: PickNumberViewFactory

    init(pickGameViewFactory: PickGameViewFactory, pickNumberViewFactory: PickNumberViewFactory) {
        self.pickGameViewFactory = pickGameViewFactory
        self.pickNumberViewFactory = pickNumberViewFactory
    }

    func makeCoordinator() -> PickCoordinator {
        return PickCoordinator(
            pickGameViewFactory: pickGameViewFactory,
            pickNumberViewFactory: pickNumberViewFactory
        )
    }
}
