//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol Viewable: class {}

extension Viewable {
    var viewController: UIViewController? {
        return self as? UIViewController
    }
}
