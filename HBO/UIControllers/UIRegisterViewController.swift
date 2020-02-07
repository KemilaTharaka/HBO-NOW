import UIKit
import FirebaseAuth
import GoogleSignIn



class UIRegisterViewController: UIViewController {
    
    @IBOutlet weak var txtFName: UITextField!
    
    @IBOutlet weak var txtLname: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtCpass: UITextField!
    
    @IBOutlet weak var txtZip: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.addStylesToRegister()

    }
    
    @IBAction func GoogleSignInButton(_ sender: Any){
        GIDSignIn.sharedInstance().delegate=self as! GIDSignInDelegate
        GIDSignIn.sharedInstance().uiDelegate=self as! GIDSignInUIDelegate
        GIDSignIn.sharedInstance().signIn()
    }
    
    func signInWillDispatch(_ signIn: GIDSignIn!, error: Error!) {
    }
    
    func signIn(_ signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func signIn(_ signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnRegister(_ sender: Any) {
        
        let validator = ValidateFields()
        
        if(validator.usernameValid(username: (txtEmail.text ?? "")) && validator.passwordValid(password: txtPassword.text ?? "")) {
            
            let alert = AlertDialog()
            
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) {
                
                authResult, error in
                if ((error == nil)) {
                    
                    alert.showAlert(title: "Signed up successfully", message: "You have been successfully Signed up", buttonText: "Dashboard")
                    
                } else {
                    
                    alert.showAlert(title: "Error", message: "Error occured", buttonText: "Dashboard")
                }
                
                // ...
            }
            
        }else{
            
            let alert = AlertDialog()
            
            alert.showAlert(title: "Error", message: "Username or password is invalid", buttonText: "Register")
        }
        
    }
    
    func addStylesToRegister()  {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        txtFName.roundCorners([.topLeft,], radius: 10)
        
        txtLname.roundCorners([.topRight,], radius: 10)
        
        txtEmail.roundCorners([.bottomLeft,.bottomRight], radius: 10)
        
        txtPassword.roundCorners([.topLeft,.topRight], radius: 10)
        
        txtCpass.roundCorners([.bottomLeft,.bottomRight], radius: 10)
        
        txtZip.roundCorners([.bottomLeft,.bottomRight,.topRight,.topLeft], radius:10)
        
        txtFName.setLeftPaddingPoints(8)
        
        txtLname.setLeftPaddingPoints(8)
        
        txtEmail.setLeftPaddingPoints(8)
        
        txtPassword.setLeftPaddingPoints(8)
        
        txtCpass.setLeftPaddingPoints(8)
        
        txtZip.setLeftPaddingPoints(8)
        
        txtFName.placeholderColor(color: UIColor.white)
        
        txtLname.placeholderColor(color: UIColor.white)
        
        txtEmail.placeholderColor(color: UIColor.white)
        
        txtPassword.placeholderColor(color: UIColor.white)
        
        txtCpass.placeholderColor(color: UIColor.white)
        
        txtZip.placeholderColor(color: UIColor.white)
    }
    
    
}
