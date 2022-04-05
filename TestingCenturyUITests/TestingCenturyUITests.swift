import XCTest

class TestingCenturyUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func testAddingNewCentury() throws {
        addCenturyFromTextField("1203")
        
        XCTAssertTrue(app.staticTexts["13th"].exists,
                      "Century didn't appear on the main screen")
        
        app.tabBars["Tab Bar"].buttons["History"].tap()
        XCTAssert(
            app.tables["HistoryTableView"].cells.element(matching: .cell, identifier: "CellYear1203").exists,
            "Century didn't appear in history screen. Probably didn't saved")
    }
    
    private func addCenturyFromTextField(_ year: String) {
        let textField = app.textFields["Year"]
        textField.tap()
        textField.typeText(year)
        app.children(matching: .window).element(boundBy: 0).tap()
        app.buttons["What Century?"].tap()
    }
}
