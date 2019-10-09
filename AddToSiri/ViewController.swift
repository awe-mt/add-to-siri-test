//
//  ViewController.swift
//  AddToSiri
//
//  Created by Anthony on 2019/10/09.
//  Copyright © 2019 Moneytree KK. All rights reserved.
//

import Intents
import IntentsUI
import IntentKit
import UIKit

class ViewController: UIViewController {

  @objc
  func addToSiri(_ sender: Any) {
    let intent = IntentIntent()
    // Setting the invocation phrase here pre-fills it in the view controller.
    intent.suggestedInvocationPhrase = NSLocalizedString("invocation_phrase", comment: "")
    if let shortcut = INShortcut(intent: intent) {
      let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
      viewController.delegate = self
      present(viewController, animated: true, completion: nil)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let button = INUIAddVoiceShortcutButton(style: .whiteOutline)
    button.addTarget(self, action: #selector(addToSiri(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(button)
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
}

extension ViewController: INUIAddVoiceShortcutViewControllerDelegate {
  func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }

  func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
    controller.dismiss(animated: true, completion: nil)
  }
}
