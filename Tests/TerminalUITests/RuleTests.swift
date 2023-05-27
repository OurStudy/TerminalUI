import XCTest
@testable import TerminalUI

final class RuleTests: XCTestCase {
    func testExample() throws {
        let console = TerminalUI.Console()
        
        let rule = Rule(title: "  会计概述  ")
        console.print(rule)
        
        let ruleStar = Rule(title: " Xcode ", characters: "*")
        console.print(ruleStar)
    }
}
