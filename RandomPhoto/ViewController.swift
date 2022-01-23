//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nithin Pradeep on 23/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
         let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemGreen,
        .systemCyan,
        .systemYellow,
        .systemPurple,
        .systemIndigo
    ]
    
    let urls: [String] = [
        "https://i.imgur.com/HfHUkqV.png",
        "https://i.imgur.com/NG4EY91.jpeg",
        "https://i.imgur.com/udBVdwu.jpeg",
        "https://i.imgur.com/EEMgvHQ.jpeg",
        "https://i.imgur.com/r0U0MTx.jpeg",
        "https://i.imgur.com/ziRwnCJ.jpeg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
        getRandomPhoto(urlString: urls.randomElement()!)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto(urlString: urls.randomElement()!)
        view.backgroundColor = colors.randomElement()
    }

    func getRandomPhoto(urlString: String) {
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }

}

