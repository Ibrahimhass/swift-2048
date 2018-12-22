//
//  TileView.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

#if os(OSX)
import AppKit
public typealias View = NSView
public typealias Color = NSColor
public typealias Label = NSTextField
public typealias Font = NSFont

#else
import UIKit
public typealias View = UIView
public typealias Color = UIColor
public typealias Label = UILabel
public typealias Font = UIFont
#endif

extension Label {
    func setText(alignment: NSTextAlignment) {
        #if os(OSX)
        self.alignment = alignment
        #else
        self.textAlignment = alignment
        #endif
    }
    
    func set(text: String) {
        #if os(OSX)
        stringValue = text
        #else
        self.text = text
        #endif
    }
    
    func set(minimumScaleFactor: CGFloat) {
        #if os(OSX)
        return
        #else
        self.minimumScaleFactor = minimumScaleFactor
        #endif
    }
}

extension View {
    func set(backgroundColor color: Color) {
        #if os(OSX)
        layer?.backgroundColor = color.cgColor
        #else
        backgroundColor = color
        #endif
    }
    
    func set(cornerRadius : CGFloat) {
        #if os(OSX)
        layer?.cornerRadius = cornerRadius
        #else
        layer.cornerRadius = cornerRadius
        #endif
    }
}

/// A view representing a single swift-2048 tile.
class TileView : View {
  var value : Int = 0 {
    didSet {
      self.set(backgroundColor: delegate.tileColor(value))
      numberLabel.textColor = delegate.numberColor(value)
      numberLabel.set(text: "\(value)")
    }
  }

  unowned let delegate : AppearanceProviderProtocol
  let numberLabel : Label

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }
    
  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
    delegate = d
    numberLabel = Label(frame: CGRect(x: 0, y: 0, width: width, height: width))
    numberLabel.setText(alignment: NSTextAlignment.center)
    numberLabel.set(minimumScaleFactor: 0.5)
    #if os(OSX)
    numberLabel.isEditable = false
    #endif
    numberLabel.font = delegate.fontForNumbers()

    super.init(frame: CGRect(x: position.x, y: position.y, width: width, height: width))
    addSubview(numberLabel)
    set(cornerRadius: radius)

    self.value = value
    self.set(backgroundColor: delegate.tileColor(value))
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.set(text: "\(value)")
  }
}
