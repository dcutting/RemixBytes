//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class GamePanelContainerFactory {
    func make() -> GamePanelContainer {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "GamePanelContainer") as! GamePanelContainer
    }
}

class GamePanelContainer: UIViewController {

    @IBOutlet weak var topLeftContainer: UIView!
    @IBOutlet weak var bottomLeftContainer: UIView!
    @IBOutlet weak var rightContainer: UIView!

    var topLeft: UIViewController? {
        didSet {
            configurePanel(child: topLeft, childContainer: topLeftContainer)
        }
    }

    var bottomLeft: UIViewController? {
        didSet {
            configurePanel(child: bottomLeft, childContainer: bottomLeftContainer)
        }
    }

    var right: UIViewController? {
        didSet {
            configurePanel(child: right, childContainer: rightContainer)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePanel(child: topLeft, childContainer: topLeftContainer)
        configurePanel(child: bottomLeft, childContainer: bottomLeftContainer)
        configurePanel(child: right, childContainer: rightContainer)
    }

    private func configurePanel(child: UIViewController?, childContainer: UIView?) {
        guard
            let child = child,
            let childContainer = childContainer
        else { return }
        addChildViewController(child)
        child.view.frame = childContainer.bounds
        childContainer.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }
}
