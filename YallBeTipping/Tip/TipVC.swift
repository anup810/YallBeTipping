//
//  TipVC.swift
//  YallBeTipping
//
//  Created by Anup Saud on 2025-01-06.
//

import UIKit

class TipVC: UIViewController {
    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(didTapBarButton))
        return button
    }()

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var skipButton: UIButton!
    var items:[MenuItem]
    init(coder:NSCoder,items:[MenuItem]){
        self.items = items
        super.init(coder: coder)!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(items)
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 15
        stackView.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 20
        }
       
    }
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait{
            stackView.axis = .vertical
            
        }else if orientation.isLandscape{
            stackView.axis = .horizontal
        }
    }
    @objc func didTapBarButton(){}
    
    @IBAction func didTapSmallTipButton() {
    }
    
    @IBAction func didTapMediumTopButton() {
    }
    
    @IBAction func didTapLargeTipButton() {
    }
    
    @IBAction func didTapSkipButton() {
    }
}
