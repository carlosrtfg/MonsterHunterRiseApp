//
//  HomeViewController.swift
//  MonsterHunterRiseApp
//
//  Created by Carlos Rodriguez toledo on 3/5/23.
//

import UIKit

enum ProviderType: String {
    case basic
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var proLabel: UILabel!
    
    
    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
           guard let email = aDecoder.decodeObject(forKey: "email") as? String,
                 let providerRawValue = aDecoder.decodeObject(forKey: "provider") as? String,
                 let provider = ProviderType(rawValue: providerRawValue)
           else {
               return nil
           }
           self.email = email
           self.provider = provider
           super.init(coder: aDecoder)
       }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "hola"
        
        

        

    }
    

}
