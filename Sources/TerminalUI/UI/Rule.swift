//
//  Rule.swift
//  TerminalUI
//
//  Created by fushujiong on 2023/5/27.
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

public struct Rule: ConsolePrintable {
    public var title: String
    public var characters: String
    public var end: String
    public var ruleLineStyle: TextStyle
    public var titleStyle: TextStyle
    
    public init(title: String,
         characters: String = "-",
         end: String = "\n",
         ruleLineStyle: TextStyle = TextStyle(foregroundColor: .lightBlue),
         titleStyle: TextStyle = TextStyle()
    ) {
        self.title = title
        self.characters = characters
        self.end = end
        self.ruleLineStyle = ruleLineStyle
        self.titleStyle = titleStyle
    }
    
    public func render(_ context: TerminalUI.Context) -> ANSIAttributedString {
        let sideWidth = (context.windowSize.width - title.cellWidth()) / 2
        let left: String = characters * (sideWidth / characters.cellWidth() + 1)
        let leftAttributedString = ANSIAttributedString(string: left, style: ruleLineStyle)
        let midAttributedString = ANSIAttributedString(string: title, style: titleStyle)
        return leftAttributedString + midAttributedString + leftAttributedString
    }
}
