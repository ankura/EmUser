
# EmaarUsers

The User List App is a simple iOS application that displays a list of users on a List View screen and provides detailed information about each user on a Details View screen. The app retrieves user data from the random user public API (https://randomuser.me/api/?results=100&) and saves it locally using Core Data. The List View screen is implemented in Objective-C, while the Details View screen is implemented in Swift. The app follows the MVVM design pattern.

## Requirements

- Xcode
- Objective-C language
- Swift language
- Core Data framework
- SDWebImage

## Features

- MVVM design pattern
- List View screen displaying a list of users with their name, email, country, and registration date.
- Details View screen showing detailed information about the selected user.
- Pagination support to load additional users from the local db.
- Error handling to capture and display errors.
- Data retrieval from the random user public API.
- Local storage using Core Data.


## Installation

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. If SDWebImage is not working, please remove it from packages and try to add it again as per below

  a. SDWebImage support SwiftPM from version 5.1.0. To use SwiftPM, you should use Xcode 11 to open your project. Click File -> Swift Packages -> Add Package Dependency, enter [SDWebImage repo's URL](https://github.com/SDWebImage/SDWebImage.git). Or you can login Xcode with your GitHub account and just type SDWebImage to search.

  b. After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.
4. Build and run the app on a simulator or a physical device.

## Usage

1. Launch the app on your iOS device.
2. The app will display the List screen, you can scroll the list till 200 users. Select on any user will open its Details View screen with user details.
3. If there are any errors, appropriate error messages will be displayed.

## Project Structure

The project follows a standard structure:

- `UserList/`: Contains the classes for User's list screen.
- `UserDetail/`: Contains the classes for User's details screen.
- `Model/`: Contains the data model classes.
- `AppDelegate.swift`: The app delegate class.
- `Assets/`: Contains assets used in the app.
- `LaunchScreen.storyboard`: The launch screen storyboard file.
- `User.storyboard`: The storyboard file related to user's screen.
- `Info.plist`: The app configuration file.
- `EmaarUsers.xcdatamodeld`: The core data file for the app.
- Classes for accessing coredata.
- `README.md`: The project's README file.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements
- [Objective C](https://developer.apple.com/documentation/objectivec?language=objc)
- [Swift](https://developer.apple.com/swift/)
- [Xcode](https://developer.apple.com/xcode/)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)


## Contact

For any questions or inquiries, please contact [ankurstp2100l@gmail.com](mailto:ankurstp2100l@gmail.com).

---
