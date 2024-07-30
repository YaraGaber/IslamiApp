# IslamiApp

IslamiApp is a mobile application built using Flutter that provides users with Islamic content, including the Quran, Hadith, and radio stations. The app features multiple screens and supports theming and localization.

## Features

- **Quran Screen**: View and read the Quran.
- **Hadith Screen**: Access Hadiths from various sources.
- **Sabha Screen**: Display Tasbeeh (dhikr) counts.
- **Radio Screen**: Listen to Islamic radio stations.
- **Theme Support**: Light and dark themes.
- **Localization**: Supports multiple languages.

## Screenshots
![Hadith Screen](https://github.com/YaraGaber/IslamiApp/blob/master/img/hadeth.PNG?raw=true)
![Quran Screen](https://github.com/YaraGaber/IslamiApp/blob/master/img/quran.PNG?raw=true)
![Sabha Screen](https://github.com/YaraGaber/IslamiApp/blob/master/img/sab7a.PNG?raw=true)
![Radio Screen](https://github.com/YaraGaber/IslamiApp/blob/master/img/radio.PNG?raw=true)
![dark theme](https://github.com/YaraGaber/IslamiApp/blob/master/img/dark%20theme.PNG?raw=true)
![light thmeme](https://github.com/YaraGaber/IslamiApp/blob/master/img/light%20theme.PNG?raw=true)
![quran content](https://github.com/YaraGaber/IslamiApp/blob/master/img/sura%20%20content.PNG?raw=true)


## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/YaraGaber/IslamiApp.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd IslamiApp
    ```

3. **Install dependencies:**

    ```bash
    flutter pub get
    ```

4. **Run the app:**

    ```bash
    flutter run
    ```

## API Integration

- The Radio tab fetches data from an external API. Ensure that you have the necessary API key and access permissions.

## Project Structure

- **`lib/domain/`**: Contains domain models and use cases.
- **`lib/data/`**: Includes data sources and repositories.
- **`lib/ui/`**: Houses the presentation layer, including screens and widgets.

