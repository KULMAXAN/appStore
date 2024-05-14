//
//  ViewController.swift
//  CardFlipper
//
//  Created by Ualikhan Sabden on 25.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: control + command + space for emoji
    let emojiTexts = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "😆", "🙊", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "😆", "🙊", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "😆", "🙊", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "😆", "🙊"]//.shuffled()
    
    
    lazy var buttonsArray = [UIButton]()
    
    var openedCards = [UIButton]()
    
    var currentOpenedCard = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignals()
        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .black
        
        var horizontalStackViews = [UIStackView]()
        
        for i in stride(from: 0, to: 32, by: 4) {
            let stackView = makeHorizontalStackView(views: Array(buttonsArray[i...(i + 3)]))
            stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            horizontalStackViews.append(stackView)
        }
        
        

        let verticalStackView = UIStackView(arrangedSubviews: horizontalStackViews)
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        verticalStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        verticalStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
    }
    
    
    func setupSignals() {
        
        for _ in 0..<32 {
            let button = makeButton()
            buttonsArray.append(button)
        }
        
        
        for buttonIndex in 0..<buttonsArray.count {
            let button = buttonsArray[buttonIndex]
            let emoji = emojiTexts[buttonIndex]
            button.setTitle(emoji, for: .selected)
            button.addTarget(self, action: #selector(handleButtonPressed), for: .touchUpInside)
        }
        
        
    }
    
    
    @objc func handleButtonPressed(button: UIButton) {
        
        if currentOpenedCard < 2 {
            openedCards.append(button)
            currentOpenedCard += 1
            
            if openedCards.count == 2 {
                if openedCards[0].title(for: .selected) == openedCards[1].title(for: .selected) {
                    if openedCards[0] != openedCards[1] {
                        UIView.animate(withDuration: 0.7) {
                            self.openedCards[0].alpha = 0
                            self.openedCards[1].alpha = 0
                        }
                    }
                }
            }
        } else if currentOpenedCard == 2 {
            print("openedCards \(openedCards)")
            
            if openedCards[0].title(for: .selected) == openedCards[1].title(for: .selected) {
                if openedCards[0] != openedCards[1] {
//                    UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
                    UIView.animate(withDuration: 0.3) {
                        self.openedCards[0].alpha = 0
                        self.openedCards[1].alpha = 0
                    }
                }
            }
            
            buttonsArray.forEach{ button in //({ $0.isSelected = false })
                button.isSelected = false
            }
            
            currentOpenedCard = 1
            openedCards.removeAll()
            openedCards.append(button)
            
        }
        
        button.isSelected.toggle()
    }
    
    func makeHorizontalStackView(views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func makeButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle("", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
}


// MARK: - SwiftUI
import SwiftUI
@available(iOS 13.0, *)
struct MainVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
            
        }
        
        let mainVC = MainViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainVCProvider.ContainerView>) -> MainViewController {
            return mainVC
        }
        
        
    }
}
