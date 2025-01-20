# YallBeTipping

YallBeTipping is a dynamic iOS app that enables users to browse a menu, select items, adjust quantities, calculate tips, and view a detailed receipt. The app is designed with clean architecture and reusable components for efficient development and scalability.

## Features

### Home Menu
- Displays a list of menu items with names, prices, and images
- Allows users to add or remove items from their order
- Automatically updates the item count in the cart

### Cart Management
- Shows selected items with their quantities
- Enables adjustments to item counts directly in the cart

### Tip Calculation
- Offers multiple tipping options (e.g., 18%, 20%, 22%, or no tip)
- Users can select their preferred tip percentage

### Receipt Generation
- Displays a breakdown of selected items, the chosen tip percentage, and the total amount
- Provides a clean and user-friendly interface for viewing receipts

## Folder Structure

### Confirm
- `ConfirmCell.swift`: Custom table view cell for the cart
- `ConfirmVC.swift`: View controller for managing the cart screen

### Home
- `HomeTableCell.swift`: Custom table view cell for menu items
- `HomeViewController.swift`: View controller for the home menu

### Model
- `Api.swift`: Simulates fetching menu data
- `MenuItem.swift`: Represents a menu item model
- `TipOption.swift`: Enum for tip percentages

### Receipt
- `ReceiptItemRow.swift`: Custom cell for displaying item details in the receipt
- `ReceiptTipRow.swift`: Custom cell for displaying the selected tip percentage
- `ReceiptTotalRow.swift`: Custom cell for displaying the total amount
- `ReceiptVC.swift`: View controller for the receipt screen

### Tip
- `TipVC.swift`: View controller for selecting a tip percentage

## How It Works

1. **Home Screen**
   - Users can browse the menu and adjust item quantities
   - Items with a quantity greater than zero are added to the cart

2. **Cart Screen**
   - Displays all selected items and their quantities
   - Allows users to update quantities directly from the cart
   - Users can proceed to the tip selection screen

3. **Tip Selection**
   - Users choose from predefined tip percentages or skip tipping

4. **Receipt Screen**
   - Displays the itemized order, selected tip, and total amount

## Key Components

### 1. MenuItem
Represents a menu item with:
- `name`: Name of the item
- `price`: Price of the item
- `img`: Image name of the item
- `count`: Quantity of the item

### 2. TipOption
Enum for tip percentages with values:
- `.small`: 18%
- `.medium`: 20%
- `.large`: 22%
- `.none`: No tip

### 3. Api
Singleton class to simulate fetching menu data

### 4. Custom Table View Cells
- `HomeTableCell`: Displays menu items in the home screen
- `ConfirmCell`: Displays items in the cart screen
- `ReceiptItemRow`: Displays items in the receipt screen
- `ReceiptTipRow`: Displays the selected tip percentage
- `ReceiptTotalRow`: Displays the total cost

### 5. View Controllers
- `HomeViewController`: Displays the menu and manages item selection
- `ConfirmVC`: Displays the cart and manages quantities
- `TipVC`: Allows tip selection
- `ReceiptVC`: Displays the order summary, tip, and total amount

## Dependencies

- **UIKit**: Used for building the user interface
- **Storyboard**: For designing views and managing transitions

## Setup

1. Clone the repository:
```bash
git clone https://github.com/anup810/YallBeTipping.git
```

2. Open the project in Xcode:
```bash
open YallBeTipping.xcodeproj
```

3. Build and run the project:
   - Select a simulator or connected device
   - Press `Cmd + R` to run the app

