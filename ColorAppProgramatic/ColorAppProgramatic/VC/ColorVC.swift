//
//  ColorVC.swift
//  ColorAppProgramatic
//
//  Created by albert coelho oliveira on 10/10/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {
    var score = 0
    var highScore = 0
    var game = RGBColors()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        constainLabels()
        configureImageView()
        constrainButton()
        contrainNewGameButton()
    }
    lazy var colorImage: UIView = {
        let colorIm = UIView()
        colorIm.backgroundColor = game.giveRandomUIColor()
        return colorIm
    }()
    lazy var count: UILabel = {
        let colorLabel = UILabel()
        colorLabel.text = "Score: 0"
        return colorLabel
    }()
    lazy var scoreLabel: UILabel = {
        let scoreLabel = UILabel()
        scoreLabel.text = "HighScore: 0"
        return scoreLabel
    }()
    lazy var redButton: UIButton = {
        let redButton = UIButton()
        redButton.tag = 0
        redButton.addTarget(self, action: #selector(checkColor(button:)), for: .touchUpInside)
        redButton.backgroundColor = .red
        redButton.setTitle("Red", for: .normal)
        return redButton
    }()
    lazy var blueButton: UIButton = {
        let blueButton = UIButton()
        blueButton.tag = 1
        blueButton.backgroundColor = .blue
        blueButton.addTarget(self, action: #selector(checkColor(button:)), for: .touchUpInside)
        blueButton.setTitle("Blue", for: .normal)
        return blueButton
    }()
    lazy var greenButton: UIButton = {
        let greenButton = UIButton()
        greenButton.tag = 2
        greenButton.addTarget(self, action: #selector(checkColor(button:)), for: .touchUpInside)
        greenButton.backgroundColor = .green
        greenButton.setTitle("Green", for: .normal)
        return greenButton
    }()
    lazy var playAgainButton: UIButton = {
        let playAgainButton = UIButton()
        playAgainButton.backgroundColor = .lightGray
        playAgainButton.addTarget(self, action: #selector(playAgain(button:)), for: .touchUpInside)
        playAgainButton.setTitle("Play again?", for: .normal)
        playAgainButton.isHidden = true
        return playAgainButton
    }()
    lazy var newGame: UIButton = {
        let newGame = UIButton()
        newGame.backgroundColor = .white
        newGame.isHidden = true
        return newGame
    }()
    
    @objc func playAgain(button: UIButton){
        if score > highScore{
            scoreLabel.text = "High Score: \(score.description)"
        }
        resetScore()
        enableButton()
        changeColor()
        playAgainButton.isHidden = true
    }
    
    @objc func checkColor(button: UIButton){
        switch button.tag{
        case 0:
            if "red" == game.getBiggest(){
                updateScore()
                changeColor()
                return
            }
        case 1:
            if "blue" == game.getBiggest(){
                updateScore()
                changeColor()
                return
            }
        default:
            if "green" == game.getBiggest(){
                updateScore()
                changeColor()
                return
            }
        }
        playAgainButton.isHidden = false
        disableButtons()
    }
    
    
    func enableButton(){
    blueButton.isEnabled = true
             redButton.isEnabled = true
             greenButton.isEnabled = true
    }
    func disableButtons(){
        blueButton.isEnabled = false
        redButton.isEnabled = false
        greenButton.isEnabled = false
    }
    func updateScore() {
        score += 1
        scoreLabel.text = "Score: \(score.description)"
    }
    func resetScore(){
        score = 0
        scoreLabel.text = "Score: \(score.description)"
    }
    
    func changeColor(){
        self.game = RGBColors()
        colorImage.backgroundColor = game.giveRandomUIColor()
    }
    private func configureImageView() {
        view.addSubview(colorImage)
        colorImage.translatesAutoresizingMaskIntoConstraints = false
        colorImage.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 30).isActive = true
        colorImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4).isActive = true
        colorImage.widthAnchor.constraint(equalTo: colorImage.heightAnchor, multiplier: 0.75).isActive = true
        colorImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func constrainButton(){
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton,blueButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: colorImage.bottomAnchor, constant: 40).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
    }
    private func constainLabels(){
        let labStack = UIStackView(arrangedSubviews: [scoreLabel, count])
        labStack.translatesAutoresizingMaskIntoConstraints = false
        labStack.axis = .horizontal
        labStack.spacing = 8
        labStack.distribution = .equalCentering
        view.addSubview(labStack)
        labStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        labStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        labStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        labStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
        
    }
    private func contrainNewGameButton(){
        view.addSubview(playAgainButton)
        playAgainButton.translatesAutoresizingMaskIntoConstraints = false
        playAgainButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 30).isActive = true
        playAgainButton.heightAnchor.constraint(equalTo: redButton.heightAnchor).isActive = true
        playAgainButton.widthAnchor.constraint(equalTo: redButton.widthAnchor).isActive = true
        playAgainButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
}
