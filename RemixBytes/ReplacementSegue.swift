//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class ReplacementSegue: UIStoryboardSegue {
    override func perform() {
        let window = source.view.window
        window?.rootViewController = destination
    }
}
