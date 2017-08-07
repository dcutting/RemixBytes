//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol PlayGameViewDelegate: class {
    func didTapOK()
}

struct PlayGameViewData {
    let result: String
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
        outputLabel.text = viewData?.result
    }

    @IBAction func didTapOK(_ sender: Any) {
        delegate?.didTapOK()
    }
}
