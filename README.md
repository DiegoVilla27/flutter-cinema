# Flutter Movie App 📱

A Flutter app that allows users to explore and manage movies with features such as:

- **List of Current Movies**
- **Movies Now Playing in Theaters**
- **Top Rated Movies**
- **Upcoming Movies**
- **Movie Search**
- **Add/Remove Movies to/from Favorites**

This app is built using **Hive** for local storage of favorite movies, **Riverpod** for state management, and follows **Clean Architecture** for a modular, scalable, and maintainable structure.

## Features 🎨

- **Current Movies**: Displays a list of movies that are currently showing in theaters.
- **Movies Now Playing**: Shows the movies that are actively playing in cinemas.
- **Top Rated Movies**: Displays a list of the highest-rated movies based on user reviews and ratings.
- **Upcoming Movies**: Lists the movies that are scheduled to be released in the future.
- **Search Movies**: Provides a search bar where users can search for movies by title.
- **Favorites**: Users can add and remove movies from their favorites list, which is stored locally using Hive.

## Technologies Used 🛠️

- **Flutter**: The app is built using the Flutter framework for cross-platform mobile development.
- **Hive**: A lightweight and fast local database used to store favorite movies offline.
- **Riverpod**: A modern state management solution for Flutter, used for managing the state of movie lists and user interactions.
- **Clean Architecture**: Follows the principles of Clean Architecture to separate concerns and improve maintainability.

## Architecture Overview ⚙️

The app is designed with **Clean Architecture** to ensure a separation of concerns:

- **Domain Layer**: Contains business logic, use cases, and entities.
- **Data Layer**: Handles data sources (remote API and local database).
- **Presentation Layer**: Manages UI components and Riverpod providers.