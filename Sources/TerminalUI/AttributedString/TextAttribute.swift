//
//  TextAttribute.swift
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

public enum TextAttribute: UInt8 {
    case `default`      = 0
    case bold           = 1
    case dim            = 2
    case italic         = 3
    case underline      = 4
    case blink          = 5
    case overline       = 6
    case inverse        = 7 /// inverse foreground color and backgroud color
    case hidden         = 8
    case strike         = 9
    case noBold         = 21
    case noDim          = 22
    case noItalic       = 23
    case noUnderline    = 24
    case noBlink        = 25
    case noOverline     = 26
    case noInverse      = 27
    case noHidden       = 28
    case noStrike       = 29
}
