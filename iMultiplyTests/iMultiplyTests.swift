//
//  iMultiplyTests.swift
//  iMultiplyTests
//
//  Created by Massimiliano Bartolini on 2022/12/06.
//

@testable import iMultiply
import XCTest

final class iMultiplyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testQuestionOperandsWithinBounds() {
        let question = Question()
        
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.left, 12)
    }
    
    func testQuestionStringIsFormattedCorrectly() {
        let question = Question(left: 5, right: 3, operation: .multiply)
        XCTAssertEqual(question.string, "What is 5 multiplied by 3?")
    }

    func testAddingWorks() {
        let question = Question(left: 5, right: 3, operation: .add)
        XCTAssertEqual(question.answer, 8)
    }
    
    func testStringInputWorks() {
        let question = Question(left: 5, right: 5, operation: .add)
        let game = iMultiply()
        let result = game.process("10", for: question)
        XCTAssertEqual(result, "Correct!")
    }
    
    func testGameCompletesAt11thQuestion() {
        let game = iMultiply()
        game.answerFunction = { "556" }
        game.start()
        XCTAssertEqual(game.questionNumber, 11)
        XCTAssertEqual(game.score, 0)
    }
}
