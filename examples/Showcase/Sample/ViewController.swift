//
//  ViewController.swift
//  Sample
//
//  Created by Roy Marmelstein on 05/08/2015.
//  Copyright (c) 2015 Roy Marmelstein. All rights reserved.
//

import UIKit
import Localize_Swift

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var actionSheet: UIAlertController!
    
    let availableLanguages = Localize.availableLanguages()
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setText()
    }
    
    // Add an observer for LCLLanguageChangeNotification on viewWillAppear. This is posted whenever a language changes and allows the viewcontroller to make the necessary UI updated. Very useful for places in your app when a language change might happen.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setText", name: LCLLanguageChangeNotification, object: nil)
    }
    
    // Remove the LCLLanguageChangeNotification on viewWillDisappear
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: Localized Text
    
    func setText(){
        textLabel.text = "Hello world".localized();
        changeButton.setTitle("Change".localized(), forState: UIControlState.Normal)
        resetButton.setTitle("Reset".localized(), forState: UIControlState.Normal)
    }
    
    // MARK: IBActions

    @IBAction func doChangeLanguage(sender: AnyObject) {
        actionSheet = UIAlertController(title: nil, message: "Switch Language", preferredStyle: UIAlertControllerStyle.ActionSheet)
        for language in availableLanguages {
            let displayName = Localize.displayNameForLanguage(language)
            let languageAction = UIAlertAction(title: displayName, style: .Default, handler: {
                (alert: UIAlertAction!) -> Void in
                    Localize.setCurrentLanguage(language)
            })
            actionSheet.addAction(languageAction)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alert: UIAlertAction) -> Void in
        })
        actionSheet.addAction(cancelAction)
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }

    @IBAction func doResetLanguage(sender: AnyObject) {
        Localize.resetCurrentLanguageToDefault()
    }
}

