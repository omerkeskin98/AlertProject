//
//  ViewController.swift
//  AlertProject
//
//  Created by Omer Keskin on 11.07.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        AlertButtonNoButtons()
        AlertButtonOneButton()
        AlertButtonTwoButtons()
        AlertButtonWithTextField()
        ActionSheetButton()
        ActivityControllerButton()
        
        
    }

    
    
    func createButton(title: String, action: Selector, yPos: CGFloat) -> UIButton {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.frame = CGRect(x: 50, y: yPos, width: view.frame.width - 100, height: 50)
            button.center.x = view.center.x
            button.addTarget(self, action: action, for: .touchUpInside)
            view.addSubview(button)
            return button
        }

       
        func AlertButtonNoButtons() {
            let button = createButton(title: "Alert with No Button", action: #selector(showAlertNoButtons), yPos: 100)
        }

        @objc func showAlertNoButtons() {
            let alert = UIAlertController(title: "No Button Alert", message: "This is an alert with no buttons.", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }

    
        func AlertButtonOneButton() {
            let button = createButton(title: "Alert with One Button", action: #selector(showAlertOneButton), yPos: 160)
        }

        @objc func showAlertOneButton() {
            let alert = UIAlertController(title: "One Button Alert", message: "This is an alert with one button.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                print("Alert with one button was clicked")
            }))
            self.present(alert, animated: true, completion: nil)
        }

        
        func AlertButtonTwoButtons() {
            let button = createButton(title: "Alert with Two Buttons", action: #selector(showAlertTwoButtons), yPos: 220)
        }

        @objc func showAlertTwoButtons() {
            let alert = UIAlertController(title: "Two Buttons Alert", message: "This is an alert with two buttons.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                print("Yes clicked")
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
                print("No clicked")
            }))
            self.present(alert, animated: true, completion: nil)
        }

        func AlertButtonWithTextField() {
            let button = createButton(title: "Alert with TextField", action: #selector(showAlertWithTextField), yPos: 280)
        }

        @objc func showAlertWithTextField() {
            let alert = UIAlertController(title: "TextField Alert", message: "This is an alert with a text field.", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "Enter text"
            }
            alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { _ in
                if let text = alert.textFields?.first?.text {
                    print("input: \(text)")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }


        func ActionSheetButton() {
            let button = createButton(title: "Show Action Sheet", action: #selector(showActionSheet), yPos: 340)
        }

        @objc func showActionSheet() {
            let actionSheet = UIAlertController(title: "Action Sheet", message: "Choose an option.", preferredStyle: .actionSheet)
            actionSheet.addAction(UIAlertAction(title: "Option 1", style: .default, handler: { _ in
                print("Option 1 selected")
            }))
            actionSheet.addAction(UIAlertAction(title: "Option 2", style: .default, handler: { _ in
                print("Option 2 selected")
            }))
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }

    
        func ActivityControllerButton() {
            let button = createButton(title: "Show Activity Controller", action: #selector(showActivityController), yPos: 400)
        }

        @objc func showActivityController() {
            let textToShare = "some text."
            let imageToShare = UIImage(named: "bird")
            let activityViewController = UIActivityViewController(activityItems: [textToShare, imageToShare as Any], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }

}

