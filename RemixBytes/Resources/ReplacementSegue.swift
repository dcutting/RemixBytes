//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class ReplacementSegue: UIStoryboardSegue {
    override func perform() {
        let window = source.view.window
        window?.insertSubview(destination.view, belowSubview: source.view)
        destination.view.alpha = 0.0
        UIView.animate(withDuration: 0.2, animations: {
            self.source.view.alpha = 0.0
            self.destination.view.alpha = 1.0
        }) { finished in
            window?.rootViewController = self.destination
        }
    }
}
