//
//  SwipingController.swift
//  SpriteKitGameProgrammatically
//
//  Created by Ilija Mihajlovic on 5/2/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let CellReuseIdentifier = "cellId"
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrevButton), for: .touchUpInside)
        return button
    }()
    

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return button
    }()
    

    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
   lazy private var bottomControlsStackView: UIStackView = {
        var stackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .red
        return stackView
    }()
    
     let pages = [
        PageModel(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon."),
        PageModel(imageName: "heart_second", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get notified of the savings immediately when we announce them on our website. Make sure to also give us any feedback you have."),
        PageModel(imageName: "leaf_third", headerText: "VIP members special services", bodyText: ""),
        
        PageModel(imageName: "bear_first", headerText: "Join use today in our fun and games!", bodyText: "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureCollectionView()
        addSubView()
        setupConstraints()
    }
    
    @objc fileprivate func handleNextButton(_ sender: UIButton) {
        sender.popUpAnimation()
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc fileprivate func handlePrevButton(_ sender: UIButton) {
        sender.popUpAnimation()
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    fileprivate func configureCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: CellReuseIdentifier)
        collectionView.isPagingEnabled = true
    }
    
    fileprivate func addSubView() {
        [bottomControlsStackView].forEach{(view.addSubview($0))}
    }
    
     //MARK: - Constraints
    fileprivate func setupConstraints() {
        bottomControlsStackView.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 0, right: 5), size: .init(width: 0, height: 50))
    }
    
}