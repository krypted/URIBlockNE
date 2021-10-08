//
//  HomeVC.swift
//  Sift
//
//  Created by JRS on 01/05/21.
//  Copyright © 2021 Alex Grinman. All rights reserved.
//

import UIKit
import NetworkExtension
import Foundation

class HomeVC: UIViewController {
    
    var rules:[(AppName, [Rule])] = []
    var filteredRules:[(AppName, [Rule])] = []
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitBtn.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: Constants.onboardingKey) {
            self.showOnboarding()
            return
        }
        
    }
    
    @IBAction func textValueChanged(_ sender: Any) {
        if urlTextField.text?.count ?? 0 <= 3 {
            submitBtn.isEnabled = false
            submitBtn.setTitle("no entry", for: .normal)
        } else {
            submitBtn.isEnabled = true
            submitBtn.setTitle("Block", for: .normal)
        }
    }
    
    
    func showOnboarding() {
        DispatchQueue.main.async {
            let onboardingController = Storyboard.Onboarding.instantiateInitialViewController()!
            self.present(onboardingController, animated: true, completion: nil)
        }
    }

    var tracker  = true
    @IBAction func submitTrig(_ sender: Any) {
     
        try? RuleManager().deleteAll()
        self.loadRules(url: urlTextField.text!)
        
        let rules = self.rules;
        print(rules)
        let rule = rules[0].1[0]
        print(rule.isAllowed)
        if tracker {
            tracker = false
            try? RuleManager().toggle(rule: rule)
            try? RuleManager().create(rule: Rule(ruleType: .host(urlTextField.text!), isAllowed: tracker))
            self.loadRules(url: urlTextField.text!)
            submitBtn.setTitle("Allow", for: .normal)
        } else {
            tracker = true
            try? RuleManager().toggle(rule: rule)
            try? RuleManager().create(rule: Rule(ruleType: .host(urlTextField.text!), isAllowed: tracker))
            self.loadRules(url: urlTextField.text!)
            submitBtn.setTitle("Block", for: .normal)

        }
        
        
    }
    
    func loadRules(url: String) {
        do {
            var hostRules:[Rule] = []
            hostRules.append(Rule(ruleType: Test.RuleType.host(url), isAllowed: tracker))

            var newRules = [(String, [Rule])]()
    
            newRules.append(("Host Rules", hostRules))
            
            self.rules = newRules
            
            
        } catch {
            self.showWarning(title: "Error loading rules", body: "\(error)")
        }
    }
}
