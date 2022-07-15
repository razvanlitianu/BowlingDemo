import XCTest
@testable import BowlingDemo

final class BowlingDemoTests: XCTestCase {
    var sut: Game!
    
    override func setUp() async throws {
        sut = Game()
    }
    
    func testGutterGame() {
        rollMany(n: 20, pins: 0)
        XCTAssertEqual(0, sut.score)
    }
    
    func testAllOnes() {
        rollMany(n: 20, pins: 1)
        XCTAssertEqual(20, sut.score)
    }
    
    func testOneSpare() {
        rollSpare()
        sut.roll(pins: 3)
        rollMany(n: 17, pins: 0)
        XCTAssertEqual(16, sut.score)
    }
    
    func testOneStrike() {
        rollStrike()
        sut.roll(pins: 3)
        sut.roll(pins: 4)
        rollMany(n: 16, pins: 0)
        XCTAssertEqual(24, sut.score)
    }
    
    func testPerfectGame() {
        rollMany(n: 12, pins: 10)
        XCTAssertEqual(300, sut.score)
    }
}

extension BowlingDemoTests {
    private func rollMany(n: Int, pins: Int) {
        for _ in 0..<n {
            sut.roll(pins: pins)
        }
    }
    
    fileprivate func rollSpare() {
        sut.roll(pins: 5)
        sut.roll(pins: 5)
    }
    
    fileprivate func rollStrike() {
        sut.roll(pins: 10)
    }
}
