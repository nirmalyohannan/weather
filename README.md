# Weather App

![App Screenshot](snapshots/Weather_App_animated_gif.gif)

## Overview

This Flutter Weather App provides users with current weather information, including temperature, humidity, wind speed and pressure. It offers a user-friendly interface, animations and a visually appealing design to enhance the user experience.

## Features

- **Current Weather**: View real-time weather conditions for your location.
- **Location-Based**: Automatically fetches weather data based on the user's location.
- **Interactive UI**: Intuitive and interactive user interface for a seamless experience.
- **Animations**: Animations that presents smooth transistion from different weathers. Background animations and pictures that represents snowfall, Rain or hot weather etc..

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/nirmalyohannan/weather.git
    ```

2. Change to the project directory:

    ```bash
    cd weather
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Configuration

To customize the app for your needs, you can modify the following settings:

- **API Key**: Obtain a weather API key from [WeatherAPI](https://www.weatherapi.com/) and replace the placeholder in the `lib/config/credentials.dart` file.


## Dependencies

This project uses the following dependencies:

- `http`: For making HTTP requests to fetch weather data.
- `provider`: For state management.
- `geolocator`: For obtaining device location.
- `Hive`: For storing last location in databsae.

You can find the complete list of dependencies in the `pubspec.yaml` file.


## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This Weather App is open-source and available under the [MIT License](LICENSE).
