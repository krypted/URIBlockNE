//
//  OnboardingController.swift
//  Sift
//
//  Created by Alex Grinman on 1/4/18.
//  Copyright © 2018 Alex Grinman. All rights reserved.
//

import Foundation
import UIKit
import NetworkExtension
import UserNotifications

class OBNetworkPermissionsController:UIViewController {
    
    @IBOutlet weak var enabledNetSwitch:UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // net
        NEFilterManager.shared().loadFromPreferences { error in
            if let _ = error {
                self.enabledNetSwitch.isOn = false
                return
            }
            
            DispatchQueue.main.async {
                self.enabledNetSwitch.isOn = NEFilterManager.shared().isEnabled
            }
            
        }
    }
    
    @IBAction func enableNetFilterToggled() {
        if NEFilterManager.shared().providerConfiguration == nil {
            let newConfiguration = NEFilterProviderConfiguration()
            newConfiguration.username = "Test"
            newConfiguration.organization = "Test App"
            newConfiguration.filterBrowsers = true
            newConfiguration.filterSockets = true
            NEFilterManager.shared().providerConfiguration = newConfiguration
        }
        
        NEFilterManager.shared().isEnabled = true
        NEFilterManager.shared().saveToPreferences { error in
            if let err = error {
                self.showWarning(title: "Error Enabling Filter", body: "\(err)")
            }
            
            DispatchQueue.main.async {
                self.enabledNetSwitch.isOn = true
            }
        }
        UserDefaults.standard.set(true, forKey: Constants.onboardingKey)

    }
}
