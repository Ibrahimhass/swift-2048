//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

#if os(iOS)
/// A view representing a single swift-2048 tile.
class TileView : UIView {
  var value : Int = 0 {
    didSet {
      backgroundColor = delegate.tileColor(value)
      numberLabel.textColor = delegate.numberColor(value)
      numberLabel.text = "\(value)"
    }
  }

  unowned let delegate : AppearanceProviderProtocol
  let numberLabel : UILabel

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
    
  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
    delegate = d
    numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
    numberLabel.textAlignment = NSTextAlignment.center
    numberLabel.minimumScaleFactor = 0.5
    numberLabel.font = delegate.fontForNumbers()

    super.init(frame: CGRect(x: position.x, y: position.y, width: width, height: width))
    addSubview(numberLabel)
    layer.cornerRadius = radius

    self.value = value
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
}
#endif

#if os(macOS)
/// A view representing a single swift-2048 tile.

class TileView : NSView  {
    var value : Int = 0 {
        didSet {
            layer?.backgroundColor = delegate.tileColor(value).cgColor
            numberLabel.textColor = delegate.numberColor(value)
            numberLabel.stringValue = "\(value)"
        }
    }
    
    unowned let delegate : AppearanceProviderProtocol
    let numberLabel : NSTextField
    
    required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
        delegate = d
        numberLabel = NSTextField(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.alignment  = NSTextAlignment.center
//        numberLabel.minimumScaleFactor = 0.5
        numberLabel.font = delegate.fontForNumbers()
        
        super.init(frame: CGRect(x: position.x, y: position.y, width: width, height: width))
        addSubview(numberLabel)
        layer?.cornerRadius = radius
        
        self.value = value
        layer?.backgroundColor = delegate.tileColor(value).cgColor
        numberLabel.textColor = delegate.numberColor(value)
        numberLabel.stringValue = "\(value)"
    }
}

#endif
