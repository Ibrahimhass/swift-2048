//
//  AccessoryViews.swift
//  swift-2048
//
//  Created by Austin Zheng on 6/4/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

#if os(OSX)
import AppKit
#else
import UIKit
#endif

protocol ScoreViewProtocol {
  func scoreChanged(to s: Int)
}

/// A simple view that displays the player's score.
class ScoreView : View, ScoreViewProtocol {
  var score : Int = 0 {
    didSet {
      label.set(text: "SCORE: \(score)")
    }
  }

  let defaultFrame = CGRect(x: 0, y: 0, width: 140, height: 40)
  var label: Label

  init(backgroundColor bgcolor: Color, textColor tcolor: Color, font: Font, radius r: CGFloat) {
    label = Label(frame: defaultFrame)
    label.setText(alignment: .center)
    super.init(frame: defaultFrame)
    set(backgroundColor: bgcolor)
    label.textColor = tcolor
    label.font = font
    set(cornerRadius: r)
    self.addSubview(label)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  func scoreChanged(to s: Int)  {
    score = s
  }
}

// A simple view that displays several buttons for controlling the app
class ControlView {
  let defaultFrame = CGRect(x: 0, y: 0, width: 140, height: 40)
  // TODO: Implement me
}
