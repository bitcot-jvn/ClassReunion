

import UIKit

@IBDesignable
public class KTextField: UITextField {
    
    // MARK: - IBInspectable properties
    
    /// Applies border to the text view with the specified width
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    
    /// Sets the color of the border
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    /// Make the corners rounded with the specified radius
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    /// Applies underline to the text view with the specified width
    @IBInspectable public var underLineWidth: CGFloat = 0.0 {
        didSet {
            updateUnderLineFrame()
        }
    }
    
    
    /// Sets the placeholder color
    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    
    public override var placeholder: String? {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    
    /// Sets left margin
    @IBInspectable public var leftMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }
    
    /// Sets right margin
    @IBInspectable public var rightMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyles()
    }
    
    // MARK: - Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateUnderLineFrame()
        updateAccessoryViewFrame()
    }
    
    // MARK: - Styles
    private func applyStyles() {
        applyUnderLine()
        setMargins()
    }
    
    // MARK: - Underline
    private var underLineLayer = CALayer()
    private func applyUnderLine() {
        // Apply underline only if the text view's has no borders
        if borderStyle == UITextField.BorderStyle.none {
            underLineLayer.removeFromSuperlayer()
            updateUnderLineFrame()
            layer.addSublayer(underLineLayer)
            layer.masksToBounds = true
        }
    }
    
    private func updateUnderLineFrame() {
        var rect = bounds
        rect.origin.y = bounds.height - underLineWidth
        rect.size.height = underLineWidth
        underLineLayer.frame = rect
    }
    
    
    // MARK: - Margins
    private var leftAcessoryView = UIView()
    private var rightAcessoryView = UIView()
    private func setMargins() {
        // Left Margin
        leftView = nil
        leftViewMode = .never
        if leftMargin > 0 {
            if nil == leftView {
                leftAcessoryView.backgroundColor = .clear
                leftView = leftAcessoryView
                leftViewMode = .always
            }
        }
        updateAccessoryViewFrame()
        
        // Right Margin
        rightView = nil
        rightViewMode = .never
        if rightMargin > 0 {
            if nil == rightView {
                rightAcessoryView.backgroundColor = .clear
                rightView = rightAcessoryView
                rightViewMode = .always
            }
            updateAccessoryViewFrame()
        }
    }
    
    private func updateAccessoryViewFrame() {
        // Left View Frame
        var leftRect = bounds
        leftRect.size.width = leftMargin
        leftAcessoryView.frame = leftRect
        // Right View Frame
        var rightRect = bounds
        rightRect.size.width = rightMargin
        rightAcessoryView.frame = rightRect
    }
    
}


class DesignableUITextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}


extension UISearchBar
{
    func setMagnifyingGlassColorTo(color: UIColor)
    {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        self.tintColor = .white
        self.barTintColor = .white
        self.searchTextField.textColor = .white
        print(self.searchTextField.textColor = .white)
        let glassIconView = textFieldInsideSearchBar?.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = color
    }
    
    
    
}
