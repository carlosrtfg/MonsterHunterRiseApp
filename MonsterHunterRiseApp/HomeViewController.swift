import UIKit

enum ProviderType: String {
    case basic
    case google
}

class HomeViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
    public let email: String
    public let provider: ProviderType
    
    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "validacion"
        
        
      
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
}
