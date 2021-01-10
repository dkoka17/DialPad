//
//  MyView.swift
//  Lecture5Constraints
//
//  Created by Saba Khutsishvili on 10/9/20.
//

import UIKit


protocol MyViewDelegate: AnyObject {
    func buttonTap(_ sender: MyView)
}

class MyView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var button: UIButton!
    
    public var mainNumb = ""
    
    weak var delegate: MyViewDelegate? {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setup()
    }
    
    func commonInit() {
        let bundle = Bundle(for: MyView.self)
        bundle.loadNibNamed("MyView", owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
    
    func setup() {
        
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.layer.masksToBounds = true
    }
    
    func setName(main : String, second : String) {
        
        mainNumb = main
        
        button?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = main + "\n" + second as NSString

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")
        //getting both substrings
        var substring1 = ""
        var substring2 = ""
        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }
        //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont(name: "Arial", size: 28.0)!
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1, attributes: attributes1)
        let font2: UIFont = UIFont(name: "Arial", size: 12.0)!
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2, attributes: attributes2)
        //appending both attributed strings
        attrString1.append(attrString2)
        //assigning the resultant attributed strings to the button
        button?.setAttributedTitle(attrString1, for: [])
        
        
    }
    
    @IBAction func handleButtonTap() {
        delegate?.buttonTap(self)
    }
    
    public func getMainer() -> String {
        
        return mainNumb;
        
    }
    
}

