//
//  MenuItemView.swift
//  PagingMenuController
//
//  Created by Victor Igbokwe on 12/1/17.
//  Copyright (c) 2017 Treats. All rights reserved.
//

import UIKit

open class MenuItemView: UIView {
    
    open fileprivate(set) var titleLabel: UILabel!
    fileprivate var options: PagingMenuOptions!
    fileprivate var title: String!
    fileprivate var widthLabelConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    internal init(title: String, options: PagingMenuOptions) {
        super.init(frame: CGRect.zero)
        
        self.options = options
        self.title = title
        
        setupView()
        constructLabel()
        layoutLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // MARK: - Constraints manager
    
    internal func updateLabelConstraints(size: CGSize) {
        // set width manually to support ratotaion
        if case .segmentedControl = options.menuDisplayMode {
            let labelSize = calculateLableSize(size)
            widthLabelConstraint.constant = labelSize.width
        }
    }
    
    // MARK: - Label changer
    
    internal func focusLabel(_ selected: Bool) {
        if case .roundRect = options.menuItemMode {
            backgroundColor = UIColor.clear
        } else {
            backgroundColor = selected ? options.selectedBackgroundColor : options.backgroundColor
        }
        titleLabel.textColor = selected ? options.selectedTextColor : options.textColor
        titleLabel.font = selected ? options.selectedFont : options.font

        // adjust label width if needed
        let labelSize = calculateLableSize()
        widthLabelConstraint.constant = labelSize.width
    }
    
    // MARK: - Constructor
    
    fileprivate func setupView() {
        if case .roundRect = options.menuItemMode {
            backgroundColor = UIColor.clear
        } else {
            backgroundColor = options.backgroundColor
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func constructLabel() {
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = options.textColor
        titleLabel.font = options.font
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.isUserInteractionEnabled = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
    }
    
    fileprivate func layoutLabel() {
        let viewsDictionary:[String:UIView] = ["label": titleLabel]
        
        let labelSize = calculateLableSize()

        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]|", options: [], metrics: nil, views: viewsDictionary)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activate(horizontalConstraints + verticalConstraints)
        
        widthLabelConstraint = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: labelSize.width)
        widthLabelConstraint.isActive = true
    }
    
    // MARK: - Size calculator
    
    fileprivate func calculateLableSize(_ size: CGSize = UIScreen.main.bounds.size) -> CGSize {
        let labelSize = NSString(string: title).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: titleLabel.font], context: nil).size

        let itemWidth: CGFloat
        switch options.menuDisplayMode {
        case let .standard(widthMode, _, _):
            itemWidth = labelWidth(labelSize, widthMode: widthMode)
        case .segmentedControl:
            itemWidth = size.width / CGFloat(options.menuItemCount)
        case let .infinite(widthMode):
            itemWidth = labelWidth(labelSize, widthMode: widthMode)
        }
        
        let itemHeight = floor(labelSize.height)
        return CGSize(width: itemWidth + calculateHorizontalMargin() * 2, height: itemHeight)
    }
    
    fileprivate func labelWidth(_ labelSize: CGSize, widthMode: PagingMenuOptions.MenuItemWidthMode) -> CGFloat {
        switch widthMode {
        case .flexible: return ceil(labelSize.width)
        case let .fixed(width): return width
        }
    }
    
    fileprivate func calculateHorizontalMargin() -> CGFloat {
        if case .segmentedControl = options.menuDisplayMode {
            return 0.0
        }
        return options.menuItemMargin
    }
}
