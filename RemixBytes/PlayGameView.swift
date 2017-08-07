//  Copyright © 2017 cutting.io. All rights reserved.

protocol PlayGameViewFactory {
    func make() -> PlayGameView
}

protocol PlayGameViewDelegate: class {
    func didTapOK()
}

struct PlayGameViewData {
    let outputText: String
}

protocol PlayGameView: Viewable {
    var delegate: PlayGameViewDelegate? { get set }
    var viewData: PlayGameViewData? { get set }
}
