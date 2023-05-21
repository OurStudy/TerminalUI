//
//  ANSIAttributedString.swift
//  TerminalUI
//
//  Created by fushujiong on 2023/5/20.
//
//  Copyright (c) 2023 Fu Shujiong <9191apps@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

public class ANSIAttributedString: CustomStringConvertible {
    
    public var count: Int {
        if childAttributedStrings.isEmpty {
            return string.count
        }
        return childAttributedStrings.reduce(0) { partialResult, childAttributedString in
            switch childAttributedString {
            case .attributed(let childString):
                return partialResult + childString.count
            case .plain(let childString):
                return partialResult + childString.count
            }
        }
    }
    
    private var _string: String = ""
    public private(set) var string: String {
        get {
            if childAttributedStrings.isEmpty {
                return _string
            }
            return childAttributedStrings.reduce("") { partialResult, childAttributedString in
                switch childAttributedString {
                case .attributed(let childString):
                    return partialResult + childString.string
                case .plain(let childString):
                    return partialResult + childString
                }
            }
        } set {
            _string = newValue
        }
    }
    
    public init(string: String) {
        self.string = string
    }
    
    public var forgroundColor: ForegroundColor = .default
    
    public var backgroundColor: BackgroundColor = .default
    
    public var textStyles: [TextStyle] = []
    
    var needsResetToDefault: Bool = true
    
    enum ChildAttributedString {
        case plain(String)
        case attributed(ANSIAttributedString)
    }
    
    var childAttributedStrings: [ChildAttributedString] = []
    
    // MARK: - Chain Self
    
    public func foregroundColor(_ color: ForegroundColor) -> Self {
        forgroundColor = color
        if !childAttributedStrings.isEmpty {
            childAttributedStrings = childAttributedStrings.map({
                switch $0 {
                case .attributed(let childString):
                    return .attributed(childString.foregroundColor(color))
                case .plain(let childString):
                    return .attributed(childString.foregroundColor(color))
                }
            })
        }
        return self
    }
    
    public func backgroundColor(_ color: BackgroundColor) -> Self {
        backgroundColor = color
        if !childAttributedStrings.isEmpty {
            childAttributedStrings = childAttributedStrings.map({
                switch $0 {
                case .attributed(let childString):
                    return .attributed(childString.backgroundColor(color))
                case .plain(let childString):
                    return .attributed(childString.backgroundColor(color))
                }
            })
        }
        return self
    }
    
    public func style(_ styles: TextStyle...) -> Self {
        addStyles(styles)
        return self
    }
    
    private func addStyles(_ styles: [TextStyle]) {
        textStyles.append(contentsOf: styles)
        
        if childAttributedStrings.isEmpty {
            return
        }
        childAttributedStrings = childAttributedStrings.map({
            switch $0 {
            case .attributed(let childString):
                childString.addStyles(styles)
                return .attributed(childString)
            case .plain(let childString):
                let attributedString = ANSIAttributedString(string: childString)
                attributedString.addStyles(styles)
                return .attributed(attributedString)
            }
        })
    }
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        if !_string.isEmpty{
            var description: String = ""
            description += "\u{001B}[\(forgroundColor.rawValue);\(backgroundColor.rawValue)"
            textStyles.forEach {
                description += ";\($0.rawValue)"
            }
            description += "m"
            description += _string
            if needsResetToDefault {
                description += "\u{001B}[\(TextStyle.default.rawValue)m"
            }
            return description
        }
        
        return childAttributedStrings.reduce("") { partialResult, childAttributedString in
            switch childAttributedString {
            case .attributed(let childString):
                return partialResult + childString.description
            case .plain(let childString):
                return partialResult + childString
            }
        }
    }
}

public func +(_ lhs: ANSIAttributedString, _ rhs: ANSIAttributedString) -> ANSIAttributedString {
    let attributedString = ANSIAttributedString(string: "")
    if lhs.childAttributedStrings.isEmpty {
        attributedString.childAttributedStrings.append(.attributed(lhs))
    } else {
        attributedString.childAttributedStrings.append(contentsOf: lhs.childAttributedStrings)
    }
    
    if rhs.childAttributedStrings.isEmpty {
        attributedString.childAttributedStrings.append(.attributed(rhs))
    } else {
        attributedString.childAttributedStrings.append(contentsOf: rhs.childAttributedStrings)
    }
    return attributedString
}

public func +(_ lhs: ANSIAttributedString, _ rhs: String) -> ANSIAttributedString {
    let attributedString = ANSIAttributedString(string: "")
    
    if lhs.childAttributedStrings.isEmpty {
        attributedString.childAttributedStrings.append(.attributed(lhs))
    } else {
        attributedString.childAttributedStrings.append(contentsOf: lhs.childAttributedStrings)
    }
    attributedString.childAttributedStrings.append(.plain(rhs))
    return attributedString
}

public func +(_ lhs: String, _ rhs: ANSIAttributedString) -> ANSIAttributedString {
    let attributedString = ANSIAttributedString(string: "")
    attributedString.childAttributedStrings.append(.plain(lhs))
    
    if rhs.childAttributedStrings.isEmpty {
        attributedString.childAttributedStrings.append(.attributed(rhs))
    } else {
        attributedString.childAttributedStrings.append(contentsOf: rhs.childAttributedStrings)
    }
    return attributedString
}
