import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    //Basic login with FB
    
    @IBOutlet weak var authStachView: UIStackView!
    @IBOutlet weak var loginFireBase: UILabel!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var signIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Authentication"
        
        //comprobar autentificacion
        let defaults  = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
           let provider = defaults.value(forKey: "provider") as? String{
            
            authStachView.isHidden = true
            
            navigationController?.pushViewController(HomeViewController(email: email, provider: ProviderType.init(rawValue: provider)!), animated: true)
        }
        
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        if let emailt = email.text, let passswordt = password.text {
            
            Auth.auth().createUser(withEmail: emailt, password: passswordt) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?
                        .pushViewController(HomeViewController(
                            email: result.user.email!,
                            provider: .basic),
                                            animated: true)
                    
                } else {
                    let alertController = UIAlertController(title: "error",
                                                            message: "se a producido un error registrando el usuario",
                                                            preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        
        if let emailt = email.text, let passswordt = password.text {
            
            Auth.auth().signIn(withEmail: emailt, password: passswordt) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?
                        .pushViewController(HomeViewController(
                            email: result.user.email!,
                            provider: .basic),
                                            animated: true)
                    
                } else {
                    let alertController = UIAlertController(title: "error",
                                                            message: "se a producido un error registrando el usuario",
                                                            preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func googleButtonAction(_ sender: Any) {
        
    }
}
