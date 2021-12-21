
import UIKit
import Foundation

@IBDesignable class DesignView: UIView
{
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    @IBInspectable var isBorderColor:Bool = false
    @IBInspectable var borderColor: UIColor? = UIColor.white
    
    
    override func layoutSubviews()
    {
        layer.cornerRadius = cornerradius
        layer.shadowColor = sdColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = sdOpacity
        
        if isBorderColor {
            layer.borderColor = borderColor?.cgColor
            layer.borderWidth = 2.0
        }
    }
}

@IBDesignable class DesignViewWithRounded: UIView {
    
    @IBInspectable var cornerradius :CGFloat = 10
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 1
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    @IBInspectable var isBorderColor:Bool = false
    @IBInspectable var borderColor: UIColor? = UIColor.white
    
    override func layoutSubviews()
    {
        cornerradius = self.bounds.width/2
        layer.cornerRadius = cornerradius
        
        layer.shadowColor = sdColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = sdOpacity
        
        if isBorderColor {
            layer.borderColor = borderColor?.cgColor
            layer.borderWidth = 2.0
        }
    }
}

class ShadowButton: UIButton {

    override var bounds: CGRect {
        
        didSet {
            setupShadow()
        }
    }
    
    private func setupShadow() {
        
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }

}

@IBDesignable class DesignButtoun: UIButton {
    
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews() {

        self.layer.cornerRadius = cornerradius
        self.layer.shadowColor = sdColor?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = cornerradius
        self.layer.masksToBounds = false
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 8)
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowOpacity = 0.2
        
    }
}


@IBDesignable class DesignButtounForAdd: UIButton
{
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 1
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews()
    {
        cornerradius = self.bounds.width/2
        layer.cornerRadius = cornerradius
        
        layer.shadowColor = sdColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = sdOpacity
    }
}

@IBDesignable class DesignImageView: UIImageView
{
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 1
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews()
    {
        cornerradius = self.bounds.width/2
        layer.cornerRadius = cornerradius
        
        layer.shadowColor = sdColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = sdOpacity
    }
}

@IBDesignable class DesignImageViewWithouRound: UIImageView
{
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 1
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews()
    {
        layer.cornerRadius = cornerradius
        
        layer.shadowColor = sdColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = sdOpacity
    }
}

@IBDesignable class DesignCharAvtar: UIView {

    @IBInspectable var isFromCell: Bool = true
    
    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews() {
        
        var path = UIBezierPath()
        
        if isFromCell {
        
            path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topRight, .bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 20, height:  20))
            
        } else {
            path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: 20, height:  20))
        }
        
        let maskLayer = CAShapeLayer()

         maskLayer.path = path.cgPath
         layer.mask = maskLayer
        
         layer.shadowColor = sdColor?.cgColor
         layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
         let shadowPath = path
         layer.shadowPath = shadowPath.cgPath
         layer.shadowOpacity = sdOpacity
        
    }
    
    
}

@IBDesignable class DesignUITextViewCustom: UITextView {

    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var borderWidth :CGFloat = 2
    @IBInspectable var borderColor: UIColor? = UIColor.gray
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerradius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor?.cgColor
        
    }
    
}

@IBDesignable class DesignViewCustom: UIView {

    @IBInspectable var cornerradius :CGFloat = 8
    @IBInspectable var sdColor: UIColor? = UIColor.black
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 1
    @IBInspectable var sdOpacity:Float = 0.2
    
    override func layoutSubviews() {
        
        var path = UIBezierPath()
        
       
        path = UIBezierPath(roundedRect:self.bounds,
                            byRoundingCorners:[.topLeft, .topRight],
                            cornerRadii: CGSize(width: 20, height:  20))
            
       
        
        let maskLayer = CAShapeLayer()

         maskLayer.path = path.cgPath
         layer.mask = maskLayer
        
         layer.shadowColor = sdColor?.cgColor
         layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
         let shadowPath = path
         layer.shadowPath = shadowPath.cgPath
         layer.shadowOpacity = sdOpacity
        
        
    }
    
    
}

extension UITextView :UITextViewDelegate
{

    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }

    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?

            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }

            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }

    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }

    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height

            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }

    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()

        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()

        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100

        placeholderLabel.isHidden = self.text.count > 0

        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
}

class CustomDashedView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var dashWidth: CGFloat = 0
    @IBInspectable var dashColor: UIColor = .clear
    @IBInspectable var dashLength: CGFloat = 0
    @IBInspectable var betweenDashesSpace: CGFloat = 0

    var dashBorder: CAShapeLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        dashBorder?.removeFromSuperlayer()
        let dashBorder = CAShapeLayer()
        dashBorder.lineWidth = dashWidth
        dashBorder.strokeColor = dashColor.cgColor
        dashBorder.lineDashPattern = [dashLength, betweenDashesSpace] as [NSNumber]
        dashBorder.frame = bounds
        dashBorder.fillColor = nil
        if cornerRadius > 0 {
            dashBorder.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        } else {
            dashBorder.path = UIBezierPath(rect: bounds).cgPath
        }
        layer.addSublayer(dashBorder)
        self.dashBorder = dashBorder
    }
}

//@IBDesignable class lblLocalization: UILabel {
//
//    override func layoutSubviews() {
//
//        if let strText = self.text {
//
//            self.text = strText.localized()
//        }
//    }
//}

//For localization

//extension UILabel {
//
//    override open func layoutSubviews() {
//        if let strText = self.text {
//
//            self.text = strText.localized()
//        }
//    }
//
//}


extension UIView {
    
    
    func activeTextFieldBorder() {
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = Constants.Colors.colorPrimary.cgColor
    }
    
    func errorTextFieldBorder() {
        
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.red.cgColor
    }

    func addBorder(radius:CGFloat, color:CGColor = UIColor.clear.cgColor) {
        
        let rounfView:UIView = self
        rounfView.layer.cornerRadius = CGFloat(radius)
        rounfView.layer.borderWidth = 1
        rounfView.layer.borderColor = color
        rounfView.clipsToBounds = true
    }
    
}

extension UIView {
 func toImage() -> UIImage {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)

    drawHierarchy(in: self.bounds, afterScreenUpdates: true)

    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
 }
}


extension UIButton {
    @IBInspectable var adjustFontSizeToWidth: Bool {
        get {
            return self.titleLabel?.adjustsFontSizeToFitWidth ?? false
        }
        set {
            self.titleLabel?.numberOfLines = 1
            self.titleLabel?.adjustsFontSizeToFitWidth = newValue;
            self.titleLabel?.lineBreakMode = .byClipping;
            self.titleLabel?.baselineAdjustment = .alignCenters
            self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 5)
        }
    }
}
