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
    
    @IBOutlet weak var smallTipButton: UIButton!
    @IBOutlet weak var mediumTipButton: UIButton!
    @IBOutlet weak var largeTipButton: UIButton!

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var skipButton: UIButton!
    
    lazy var tipSelections:[UIButton] = [smallTipButton, mediumTipButton, largeTipButton, skipButton]
    
    var items:[MenuItem]
    var tipAmount : TipOption = .none
    
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
        smallTipButton.isSelected = true
       
    }
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait{
            stackView.axis = .vertical
            
        }else if orientation.isLandscape{
            stackView.axis = .horizontal
        }
    }
    @objc func didTapBarButton(){
        let storyBoard = UIStoryboard(name: "ReceiptVC", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "ReceiptVC") {[unowned self] coder in
            let ReceiptVC = ReceiptVC(coder: coder, items: items, tip: tipAmount)
            return ReceiptVC
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func deSelect(){
        tipSelections.forEach { button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSmallTipButton() {
        deSelect()
        smallTipButton.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didTapMediumTopButton() {
        deSelect()
        mediumTipButton.isSelected = true
        tipAmount = .medium
    }
    
    @IBAction func didTapLargeTipButton() {
        deSelect()
        largeTipButton.isSelected = true
        tipAmount = .large
    }
    
    @IBAction func didTapSkipButton() {
        deSelect()
        skipButton.isSelected = true
        tipAmount = .none
    }
}
