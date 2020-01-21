import Foundation
import UIKit
class AlertDialog {
    func showAlert(title: String,message: String,buttonText: String)  {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButton(withTitle: buttonText)
        alert.show()
    }
}
