//
// CGPoint+Common.swift
//

#if os(iOS)
import UIKit
#endif

#if os(macOS)
import Cocoa
#endif

extension CGPoint {
    
    // MARK: - Internal var
    
    var index: Canvas.Index {
        return Canvas.Index(
            x: Int(x.rounded(.down)),
            y: Int(y.rounded(.down))
        )
    }
}
