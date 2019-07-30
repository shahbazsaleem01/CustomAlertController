//
//  BeAlertViewController.swift
//  CustomProgressView
//
//  Created by Shahbaz Saleem on 7/4/19.
//  Copyright © 2019 Xhobi. All rights reserved.
//

import UIKit

open class BeAlertController: UIViewController {

    lazy public var backgroundColor = UIColor(hex: "949494")
    lazy public var backgroundAlpha: CGFloat = 0.75
    
    lazy public var contentBackgroundColor = UIColor(hex: "ebebeb")
    lazy public var contentBackgroundCornerRadius: CGFloat = 10
    
    lazy public var titleTextColor: UIColor = UIColor(hex: "211c45")
    lazy public var titleTextFont: UIFont =  UIFont.boldSystemFont(ofSize: 15)
    lazy public var spacingAfterTitle: CGFloat = 10
    
    lazy public var messageTextColor: UIColor = UIColor(hex: "211c45")
    lazy public var messageTextFont: UIFont = UIFont.systemFont(ofSize: 14)
    lazy public var spacingAfterMessage: CGFloat = 10
    
    lazy public var defaultButtonTextColor: UIColor = UIColor(hex: "ffffff")
    lazy public var defaultButtonBackgroundColor: UIColor = UIColor(hex: "f92f57")
    lazy public var defaultButtonCornerRadius: CGFloat = 5
    lazy public var defaultButtonFont: UIFont = UIFont.systemFont(ofSize: 14)
    lazy public var spacingAfterDefaultButton: CGFloat = 10
    
    lazy public var destructiveButtonTextColor: UIColor = UIColor(hex: "757575")
    lazy public var destructiveButtonBackgroundColor: UIColor = UIColor(hex: "cccccc")
    lazy public var destructiveButtonCornerRadius: CGFloat = 5
    lazy public var destructiveButtonFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    private var message: String?
    private lazy var actions =  [BeAlertAction]()
    
    //Views
    private var backgroundView: UIView!
    private var stackView: UIStackView!
    
    public init(title: String?, message: String?) {
        super.init(nibName: nil, bundle: nil)
        super.title = title
        self.message = message
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    //init?(coder aDecoder: NSCoder) called only when you create your views from storyboard. It will never be invoked since we are going with no-storyboard so we can safely fatal out.
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    
    private func setupViews(){
        view.layoutIfNeeded()
        setupBackgroundView()
        setupStackView()
        view.layoutIfNeeded()
    }
    
    private func setupBackgroundView(){
        //Styling Pending
        backgroundView = UIView(frame: view.frame)
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.alpha = backgroundAlpha
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    private func setupStackView(){
        
        let stackViewBackground = UIView(frame: CGRect.zero)
        view.addSubview(stackViewBackground)
        stackViewBackground.backgroundColor = contentBackgroundColor

        // corner radius
        stackViewBackground.layer.cornerRadius = 10
        
        // border
        stackViewBackground.layer.borderWidth = 0.001
        stackViewBackground.layer.borderColor = contentBackgroundColor.cgColor
        
        // shadow
        stackViewBackground.layer.shadowColor = UIColor.black.cgColor
        stackViewBackground.layer.shadowOffset = CGSize(width: 0, height: 0)
        stackViewBackground.layer.shadowOpacity = 0.27
        stackViewBackground.layer.shadowRadius = 15
        
        let lblTitle = UILabel(frame: CGRect.zero)
        lblTitle.text = super.title
        lblTitle.font = titleTextFont
        lblTitle.textAlignment = .center
        lblTitle.textColor = titleTextColor
        lblTitle.sizeToFit()
        
        let lblMessage = UILabel(frame: CGRect.zero)
        lblMessage.font = messageTextFont
        lblMessage.text = message
        lblMessage.textColor = messageTextColor
        lblMessage.numberOfLines = 0
        lblMessage.textAlignment = .center
        lblMessage.sizeToFit()
        
        let defaultButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 64))
        defaultButton.setTitleColor(defaultButtonTextColor, for: .normal)
        defaultButton.backgroundColor = defaultButtonBackgroundColor
        defaultButton.layer.cornerRadius = defaultButtonCornerRadius
        defaultButton.titleLabel?.font = defaultButtonFont
        defaultButton.clipsToBounds = true
        defaultButton.addTarget(self, action: #selector(didSelectDefaultButton(sender:)), for: .touchUpInside)
        
        stackView = UIStackView(arrangedSubviews: [lblTitle, lblMessage])
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.setCustomSpacing(spacingAfterTitle, after: lblTitle)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackViewBackground.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 280),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackViewBackground.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            stackViewBackground.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            stackViewBackground.widthAnchor.constraint(equalTo: stackView.widthAnchor, constant: 20),
            stackViewBackground.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: 20)
            ])
        
        
        if let action = (actions.filter{$0.style == BeAlertAction.Style.default}).first{
            
            defaultButton.setTitle(action.title, for: .normal)
        
            if let lastView = stackView.arrangedSubviews.last{
                stackView.setCustomSpacing(spacingAfterMessage, after: lastView)
            }
            
            stackView.addArrangedSubview(defaultButton)
            
            defaultButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                defaultButton.widthAnchor.constraint(equalToConstant: 150),
                defaultButton.heightAnchor.constraint(equalTo: defaultButton.widthAnchor, multiplier: 0.32),
                ])
        }
        
        
        if let action = (actions.filter{$0.style == BeAlertAction.Style.destructive}).first{
            let destructiveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 64))
            destructiveButton.addTarget(self, action: #selector(didSelectDestructiveButton(sender:)), for: .touchUpInside)
            destructiveButton.setTitleColor(destructiveButtonTextColor, for: .normal)
            destructiveButton.backgroundColor = destructiveButtonBackgroundColor
            destructiveButton.setTitle(action.title, for: .normal)
            destructiveButton.layer.cornerRadius = destructiveButtonCornerRadius
            destructiveButton.titleLabel?.font = destructiveButtonFont
            destructiveButton.clipsToBounds = true

            if let lastView = stackView.arrangedSubviews.last{
                let spacing = (lastView == lblMessage) ? spacingAfterMessage : spacingAfterDefaultButton
                stackView.setCustomSpacing(spacing, after: lastView)
            }
            
            stackView.addArrangedSubview(destructiveButton)

            destructiveButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                destructiveButton.widthAnchor.constraint(equalToConstant: 150),
                destructiveButton.heightAnchor.constraint(equalTo: destructiveButton.widthAnchor, multiplier: 0.32),
                ])
        }
    }
    
    public func addAction(_ action: BeAlertAction){
        actions.append(action)
    }
    
    @objc func didSelectDefaultButton(sender: UIButton){
        if let action = (actions.filter{$0.style == BeAlertAction.Style.default}).first{
            self.dismiss(animated: true) {
                action.handler(action)
            }
        }
    }
    
    @objc func didSelectDestructiveButton(sender: UIButton){
        if let action = (actions.filter{$0.style == BeAlertAction.Style.destructive}).first{
            self.dismiss(animated: true) {
                action.handler(action)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

public class BeAlertAction{
    public let style : Style
    public let title : String?
    fileprivate let handler : (_ action: BeAlertAction)-> Void

    public init(title: String?, style: Style, handler: @escaping (_ action: BeAlertAction) -> Void){
        self.style = style
        self.title = title
        self.handler = handler
    }
    
    public enum Style{
        case `default`
        case destructive
    }
}

fileprivate extension UIColor {
    convenience init(hex: String) {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 255, green: 255, blue: 255, alpha: 1)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
