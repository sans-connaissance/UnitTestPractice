//
//  UnitTestPracticeUITests.swift
//  UnitTestPracticeUITests
//
//  Created by David Malicke on 12/21/21.
//

import XCTest

class when_add_new_task_screen_is_presented: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        let addTaskButton = app.buttons["showAddTaskButton"]
        addTaskButton.tap()
    }
    
    func test_make_sure_screen_is_displayed() {
                
        let addTaskNavBarTitle = app.staticTexts["Add Task"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func test_ensure_all_required_controls_are_present() {
    
        XCTAssertTrue(app.textFields["addTaskTextField"].exists)
        XCTAssertTrue(app.buttons["addTaskButton"].exists)
        
    }
    
    func test_will_dismiss_modal_after_adding_new_task() {
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash the car")
        
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5))
        
    }
    
}
