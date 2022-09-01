//
//  ViewController.swift
//  SplitScreenTest
//
//  Created by Hansub Yoo on 2022/09/01.
//

import UIKit

class ViewController: UIViewController {
    let upperView = UIView()
    let lowerView = UIView()
    
    let cameraVC = CameraViewController()
    let naviVC = SecondViewController()// NaviViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        addSubviews()
        autoLayout()
        addContentsView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // layer의 frame을 인식해야하기 때문에 화면이 다 만들어진 다음에 연결해준다.
        cameraVC.addSublayer()
    }
    
    private func configure() {
        upperView.translatesAutoresizingMaskIntoConstraints = false
        lowerView.translatesAutoresizingMaskIntoConstraints = false
        
        lowerView.backgroundColor = .orange
    }
    
    private func addSubviews() {
        view.addSubview(upperView)
        view.addSubview(lowerView)
    }
    
    private func autoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            upperView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            upperView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            upperView.bottomAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            lowerView.topAnchor.constraint(equalTo: safeArea.centerYAnchor),
            lowerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            lowerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            lowerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    private func addContentsView() {
        addChild(cameraVC)
        cameraVC.view.frame = upperView.frame
        upperView.addSubview(cameraVC.view)
        cameraVC.didMove(toParent: self)
        
        // NavigationController를 직접 만들어서 연결하면에러가 생긴다.
        // 뷰컨트롤러를 만들고 코드로 네비게이션 코드 루트뷰로 연결하면 에러가 생기지 않는다.
        let navi = UINavigationController(rootViewController: naviVC)
        
        addChild(navi)
        navi.view.frame = lowerView.frame
        lowerView.addSubview(navi.view)
        navi.didMove(toParent: self)
    }
}

