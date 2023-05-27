//
//  String+AttributedString.swift
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

import Foundation

public extension String {
    
    func foregroundColor(_ color: ForegroundColor) -> ANSIAttributedString {
        let attributedString = ANSIAttributedString(string: self)
        attributedString.forgroundColor = color
        return attributedString
    }
    
    func backgroundColor(_ color: BackgroundColor) -> ANSIAttributedString {
        let attributedString = ANSIAttributedString(string: self)
        attributedString.backgroundColor = color
        return attributedString
    }
    
    func attributes(_ attributes: TextAttribute...) -> ANSIAttributedString {
        let attributedString = ANSIAttributedString(string: self)
        attributes.forEach {
            attributedString.attributes.insert($0)
        }
        return attributedString
    }
}

extension String {
    func chineseCharacterTerminalWidth() -> Int {
        let nsString = self as NSString
        var characterCount = 0
        
        for i in 0..<nsString.length {
            let range = NSRange(location: i, length: 1)
            let character = nsString.substring(with: range)
            let charLength = character.lengthOfBytes(using: String.Encoding.utf8)
            if charLength == 3 { // 中文字符在 UTF-8 编码下占用 3 个字节
                characterCount += 1
            }
        }
        
        let terminalWidth = characterCount * 2 // 中文字符在终端中通常占用两个字符位置
        return terminalWidth
    }
}
