//
//  CardSelectionVC.swift
//  CardWorkout-Programatic
//
//  Created by Ethan Gonsalves on 2022-10-19.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView       = UIImageView()
    let stopButton          = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton       = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton         = CWButton(backgroundColor: .systemCyan, title: "Rules")
    
    var cards: [UIImage]    = Cards.allValues
    var timer: Timer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configuredUI()
        startTime()
    }
    
    
    func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func restartTimer() {
        timer.invalidate()
        startTime()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    func configuredUI() {
        configuerCardImageView()
        configurStopButton()
        configurRestartButtom()
        configurRulesButton()
    }
    
    func configuerCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configurStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configurRestartButtom() {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
            
        ])
    }
    
     func configurRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    @objc func presentRulesVC() {
      
        present(RulesVC(), animated: true)
    }
}
