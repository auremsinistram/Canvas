//
// Canvas.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

#if os(iOS)
public typealias Control = UIControl
#endif

#if os(macOS)
public typealias Control = NSControl
#endif

open class Canvas: Control {
    
    // Empty.
}
