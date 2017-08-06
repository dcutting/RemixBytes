//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PlayGameViewControllerFactory: PlayGameViewFactory {
    func make() -> PlayGameView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
    }
}

class PlayGameViewController: UIViewController, PlayGameView {

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
    
    @IBAction func didTapOK(_ sender: Any) {
        delegate?.didTapOK()
    }
}
