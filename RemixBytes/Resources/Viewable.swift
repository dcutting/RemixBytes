//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol Viewable {}

extension Viewable {
    var viewController: UIViewController? {
        return self as? UIViewController
    }
}
