//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PlayGameContinuousViewControllerFactory: PlayGameViewFactory {
    func make() -> PlayGameView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PlayGameContinuousViewController") as! PlayGameContinuousViewController
    }
}

class PlayGameContinuousViewController: UIViewController, PlayGameView {

    @IBOutlet weak var outputLabel: UILabel!

    weak var delegate: PlayGameViewDelegate?
    var viewData: PlayGameViewData? {
        didSet {
            updateView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    private func updateView() {
        guard isViewLoaded else { return }
        outputLabel.text = viewData?.outputText
    }
}
