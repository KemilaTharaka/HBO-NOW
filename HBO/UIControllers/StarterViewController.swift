import UIKit
import FirebaseAuth

class StarterViewController: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.addStyleToStarterView()
        
    }
    func addStyleToStarterView()  {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if Auth.auth().currentUser != nil {
            
            self.performSegue(withIdentifier: "dashboardView", sender: self)
            
        } else {
            
            print("User session failed")
        }
    }
    
}
