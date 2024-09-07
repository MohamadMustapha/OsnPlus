////
////  UILibraryButton.swift
////
////
////  Created by Khaled Chehabeddine on 06/08/2024.
////  Copyright ©️ 2024 ___ORGANIZATIONNAME___. All rights reserved.
////
//
import Combine
import Pixel
import OSNCore
//import SnapKit
import SwiftUI

struct SwiftUIView: View {

    var body: some View {
        Text("hello UiKit")
    }
}

//class UILibraryButton: UIButton {
//
//    private let label: UILabel = {
//        let label: UILabel = .init()
//        label.text = "Let's explore"
//        label.textColor = UIColor(PixelColor.dark8)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let action: () -> Void
//
//    init(action: @escaping () -> Void) {
//        self.action = action
//
//        super.init(frame: .zero)
//
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("Storyboard not being used")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        layer.cornerRadius = bounds.height / 2
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//
//        UIView.animate(withDuration: 0.2) {
//            self.transform = .init(scaleX: 0.9, y: 0.9)
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//
//        UIView.animate(withDuration: 0.2) {
//            self.transform = .identity
//        }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesCancelled(touches, with: event)
//
//        UIView.animate(withDuration: 0.2) {
//            self.transform = .identity
//        }
//    }
//
//    func commonInit() {
//        addSubview(label)
//
//        setupUI()
//    }
//
//    func setupUI() {
//        let uiAction: UIAction = .init { [weak self] _ in
//            self?.action()
//        }
//        addAction(uiAction, for: .touchUpInside)
//
//        backgroundColor = UIColor(PixelColor.light1)
//
//        label.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.bottom.equalToSuperview().inset(PixelPadding.p5)
//        }
//    }
//}
//
#Preview {
    SwiftUIView()
//    let view: UIView = .init()
//
//    view.translatesAutoresizingMaskIntoConstraints = false
//    view.snp.makeConstraints { make in
//        make.height.equalTo(400)
//        make.width.equalTo(250)
//    }
//
//    let button: UILibraryButton = .init { }
//    view.addSubview(button)
//
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.snp.makeConstraints { make in
//        make.leading.trailing.equalToSuperview()
//    }
//
//    return view
}
