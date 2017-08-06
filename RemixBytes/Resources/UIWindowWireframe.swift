//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

extension UIWindow: WindowWireframe {

    var rootView: Viewable? {
        get {
            return rootViewController as? Viewable
        }
        set {
            rootViewController = newValue?.viewController
        }
    }
}
