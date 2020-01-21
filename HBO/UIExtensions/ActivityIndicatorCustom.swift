
import Foundation
import UIKit
extension UIActivityIndicatorView {
    
    convenience init(activityIndicatorStyle: UIActivityIndicatorView.Style, color: UIColor, placeInTheCenterOf parentView: UIView) {
        self.init(style: activityIndicatorStyle)
        center = parentView.center
        self.color = UIColor.white
        parentView.addSubview(self)
    }
}
