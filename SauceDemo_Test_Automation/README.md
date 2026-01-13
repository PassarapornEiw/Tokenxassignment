# SauceDemo Test Automation

Automated testing project for SauceDemo.com using Robot Framework with Page Object Model design pattern.

## Prerequisites

- Python 3.8 or higher
- pip (Python package manager)

## Installation

1. Navigate to the project directory:
```bash
cd "C:\Users\Eiw\Documents\Krungsri Tasks\SauceDemo_Test_Automation"
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

## Running Tests

### Run all tests:
```bash
robot -d results tests/
```

### Run specific test:
```bash
robot -d results tests/e2e_checkout_test.robot
```

### Run with specific browser:
```bash
robot -d results -v BROWSER:chrome tests/
robot -d results -v BROWSER:firefox tests/
```

## Project Structure

- `config/` - Configuration files and settings
- `variables/` - Common variables used across tests
- `resources/` - Reusable keywords and page objects
  - `keywords/` - Common keywords for test operations
  - `page_objects/` - Page Object Model implementation
- `tests/` - Test cases
- `results/` - Test execution reports and logs

## Design Pattern

This project uses the **Page Object Model (POM)** design pattern:
- Each page has its own robot file with locators and actions
- No fixed waits - using explicit waits with SeleniumLibrary's built-in waiting mechanisms
- Clean separation between test logic and page interactions
- Maintainable and scalable for team collaboration

## Test Coverage

- User login functionality
- Product selection and cart management
- Complete checkout process with order confirmation

## Test Scenario

The automated test covers the following core business flow:

1. **Login** - User logs in with valid credentials (standard_user/secret_sauce)
2. **Product Selection** - User adds one product to the shopping cart
3. **Checkout** - User completes the checkout process with shipping information
4. **Order Confirmation** - System displays order confirmation message

## Best Practices Implemented

✅ **Page Object Model** - Clear separation of page elements and actions  
✅ **No Fixed Waits** - Using explicit waits for better reliability  
✅ **Reusable Keywords** - DRY principle applied throughout  
✅ **Clear Documentation** - All keywords are well documented  
✅ **Maintainable Structure** - Easy to extend and maintain  
✅ **Team-Ready** - Clean code standards for collaboration

