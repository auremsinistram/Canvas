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

public class Canvas: Control {
    
    // MARK: - Public enum
    
    public enum State {
        
        case began
        case changed
        case ended
    }
    
    // MARK: - Public struct
    
    public struct Index: Equatable {
        
        // MARK: - Public static var
        
        public static var undefined: Index {
            return Index(x: -1, y: -1)
        }
        
        // MARK: - Public var
        
        public var x: Int
        public var y: Int
        
        // MARK: - Public init
        
        public init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
        
        // MARK: - Equatable
        
        public static func == (lhs: Index, rhs: Index) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }
    
    // MARK: - Private var
    
    private var startIndex = Index.undefined
    private var currentIndex = Index.undefined
    
    // MARK: - Public override func
    
#if os(iOS)
    
    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        proceed(with: touch, state: .began)
        return true
    }
    
    public override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        proceed(with: touch, state: .changed)
        return true
    }
    
    public override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        proceed(with: touch, state: .ended)
    }
    
#endif
    
#if os(macOS)
    
    public override func mouseDown(with event: NSEvent) {
        proceed(with: event, state: .began)
    }
    
    public override func mouseDragged(with event: NSEvent) {
        proceed(with: event, state: .changed)
    }
    
    public override func mouseUp(with event: NSEvent) {
        proceed(with: event, state: .ended)
    }
    
#endif
    
    // MARK: - Private func
    
#if os(iOS)
    
    private func proceed(with touch: UITouch?, state: State) {
        let point = touch?.location(in: self)
        proceed(with: point, state: state)
    }
    
#endif
    
#if os(macOS)
    
    private func proceed(with event: NSEvent, state: State) {
        let point = convert(event.locationInWindow, from: nil)
        proceed(with: point, state: state)
    }
    
#endif
    
    private func proceed(with point: CGPoint?, state: State) {
        let index = point?.index ?? .undefined
        switch state {
        case .began:
            startIndex = index
            currentIndex = index
            proceed(from: startIndex, to: currentIndex, state: .began)
        case .changed:
            if currentIndex == index {
                return
            }
            currentIndex = index
            proceed(from: startIndex, to: currentIndex, state: .changed)
        case .ended:
            proceed(from: startIndex, to: currentIndex, state: .ended)
            startIndex = .undefined
            currentIndex = .undefined
        }
    }
    
    private func proceed(from startIndex: Index, to currentIndex: Index, state: State) {
        // TODO: -
#if os(iOS)
        sendActions(for: .valueChanged)
#endif
#if os(macOS)
        sendAction(action, to: target)
#endif
    }
}
