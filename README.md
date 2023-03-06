# city_weather_app

Weather app is a simple app that undergoes what real world app goes through. It is built with
a clean architecture, repository design pattern and bloc state management.

The weather app fetches weather data from open weather api. 

The user enters preferred city name and the current weather information is displayed on the screen. 

## Configuring the app
Sign up at [OpenWeather](https://openweathermap.org "Open weather home"), then go to My API keys page and click
Generate API Key. 

### Storing Your API Key in a Compile-time Variable

Using the command line:

- flutter run --dart-define=open_weather_app_token=YOUR_API_KEY

To configure your IDE to handle your dart-define for you so you don’t have to specify the key every time.

### Customizing Android Studio’s Running Configs

At the top of your screen, click main.dart, then Edit Configurations…

In the Additional run args field of this default configuration, enter 

```
--dart-define=open_weather_app_token=YOUR_API_KEY
```

but replace YOUR_API_KEY with the actual key you got from [OpenWeather](https://openweathermap.org "Open weather home")

Finally, click OK.

### Customizing VS Code’s Running Configs

Click Run and Debug on the left-side panel, then click create a launch.json
file. Finally, select the Dart & Flutter environment.

Notice that VS Code created and opened a launch.json. Replace its contents with:

```
{
    "configurations": [
        {
            "name": "WeatherApp",
            "request": "launch",
            "type": "dart",
            "program": "lib/main.dart",
            "args": [
                "--dart-define",
                "open_weather_app_token=YOUR_API_KEY"
            ]
        },
    ]
}
```
replace YOUR_API_KEY with your actual key from [OpenWeather](https://openweathermap.org "Open weather home") and Save the file.

## Weather App project dependencies

Open the project in your preferred IDE. Then, fetch the project’s dependencies by using the terminal to
run make get from the root directory.
- make get 

## Run App
- flutter run