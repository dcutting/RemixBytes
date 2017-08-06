//  Copyright © 2017 cutting.io. All rights reserved.

protocol PickNumberViewFactory {
    func make() -> PickNumberView
}

protocol PickNumberViewDelegate: class {
    func didPick(number: Int)
}

protocol PickNumberView: Viewable {
    weak var delegate: PickNumberViewDelegate? { get set }
}
