//  Copyright © 2017 cutting.io. All rights reserved.

protocol GamePanelViewFactory {
    func make() -> GamePanelView
}

protocol GamePanelView: Viewable {
    var topLeft: Viewable? { get set }
    var bottomLeft: Viewable? { get set }
    var right: Viewable? { get set }
}
