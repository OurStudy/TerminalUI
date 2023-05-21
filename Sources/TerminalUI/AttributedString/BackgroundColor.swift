//
//  BackgroundColor.swift
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

public enum BackgroundColor: UInt8 {
    case black          = 40
    case red            = 41
    case green          = 42
    case brown          = 43
    case blue           = 44
    case magenta        = 45
    case cyan           = 46
    case gray           = 47 //TODO: 验证这个是 gray 还是 white
    case back256Color   = 48
    case `default`      = 49
    case lightBlack     = 100
    case lightRed       = 101
    case lightGreen     = 102
    case yellow         = 103
    case lightBlue      = 104
    case lightMagenta   = 105
    case lightCyan      = 106
    case lightWhite     = 107 //TODO: 验证这个是 lightWhite 还是 white
}
