//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PlayGameViewFactory {
    func make() -> PlayGameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PlayGameViewController") as! PlayGameViewController
    }
}

protocol PlayGameViewDelegate: class {
    func didTapOK()
}

struct PlayGameViewData {
    let outputText: String
}

class PlayGameViewController: UIViewController {

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
