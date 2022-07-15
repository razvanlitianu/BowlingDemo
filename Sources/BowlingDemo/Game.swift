public struct Game {
    private var currentRoll = 0
    private var rolls: [Int] = []
    
    mutating public func roll(pins: Int) {
        rolls.insert(pins, at: currentRoll)
        currentRoll += 1
    }
    
    fileprivate func isSpare(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] + rolls[firstInFrame + 1] == 10
    }
    
    fileprivate func isStrike(_ firstInFrame: Int) -> Bool {
        return rolls[firstInFrame] == 10
    }
    
    fileprivate func twoBallsInFrame(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame] + rolls[firstInFrame + 1]
    }
    
    fileprivate func nextTwoBallsForStrike(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame + 1] + rolls[firstInFrame + 2]
    }
    
    fileprivate func nextBallForSpare(_ firstInFrame: Int) -> Int {
        return rolls[firstInFrame + 2]
    }
    
    var score: Int {
        var score = 0
        var firstInFrame = 0
        for _ in 0..<10 {
            if isStrike(firstInFrame) {
                score += 10 + nextTwoBallsForStrike(firstInFrame)
                firstInFrame += 1
            } else if isSpare(firstInFrame) {
                score += 10 + nextBallForSpare(firstInFrame)
                firstInFrame += 2
            } else {
                score += twoBallsInFrame(firstInFrame)
                firstInFrame += 2
            }
        }
        return score
    }
}
