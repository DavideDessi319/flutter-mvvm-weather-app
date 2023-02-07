# Davide Dessì Weather App

![Alt text](./documentation/app_images/cover_image.png?raw=true "Cover Image")

This README file contains all the information about my thought process, choices and the overall experience going through the development of this application.

A UML representation of the architecture of the project is contained inside the dedicated documentation found in the following path:

- /documentation/weather-app-docs.pdf

### IMPORTANT

Before running the app, rename the ".env.example" file to ".env".
This file contains mandatory information to communicate with the OpenWeatherMap API

The README is going to be divided in sections, each of them dedicated to a particular part of the development.
The application has been developed using Flutter 3.0 and has been optimized for mobile devices on portrait mode.

## UI/UX

I decided to go with a "playful" and dynamic UI, since I thought was a good choice to keep the view interesting.
The background assets are digitally drawn by me and I divided them into three separate images per each background, to be able to create a parallax effect on scroll.
Both the background assets and the background gradient change based on the weather conditions returned by the API and on the time of the day.
I included 4 possible conditions: Cloudy, Rainy, Sunny and Night (which is based on the current time and displayed after 7PM regardless of the weather conditions).
A possible improvement to this part could be to include more assets and gradients depending on a more vast list of possible weather conditions (for example multiple night conditions).

Since, as of now, the application is a single page app, I added various scroll effects to keep it dynamic and moving at every scroll.
The top part has a gradual repositioning, redimensioning or opacity change of the element based on the scroll position on the screen, whereas the bottom part animates to two different list types when the scroll reaches a certain threshold.
A possible improvement of this part could be finding a better spot and better timing for the bottom part animation, to make the scroll and change even more natural for the user's eyes.
The refresh of the data is possible through a dedicated button at the top right corner. A possible alternative could have been a "pull to refresh", but I decided to go with a less dynamic approach on this part, to avoid overwhelming the user with excessive scroll events.

## Widgets

The app is divided into two main views contained in a CustomScrollView:

- The upper view which shows the current weather.
- The lower view which shows the forecast.

This is not necessarly the best functional or stylistic choice in terms of page structure, but I decided to use this approach as a tradeoff between functional UI creation and a way to show my knowledge on terms of widget usage, varying as much as logically possible among slivers, stacks with positioned, columns and rows.
The same result could have been obtained using other approaches, for example a DraggableScrollableSheet in a simple SingleChildScrollView with a ScrollController to animate on scroll.

I also tried to create as many custom widget as required, avoiding external UI packages, using OOTB widgets when possible and using the images provided by the OpenWeatherMap API to give a visual reference of the weather conditions.

## Native Development

On the native side, I had a doubt on which approach to use between the MethodChannel (so adding a new view on the native stack) and the Platform View (so integrating a native view on a Flutter view).
I decided to go with the first approach since I thought it was what was meant for the test and made the most sense logically in terms of testing my native capabilities.
It wasn't the first time calling a MethodChannel but it was the first time calling a new native view on top of the Flutter view.
Overall it was a very interesting part to develop and very useful for may use cases.

## Testing

This was a first time with extensive Flutter testing and a fairly long time since I tested a system. I'm very pleased to say that I enjoyed going back to testing again, especially on the unit test side. Since in Alpian Tech you try to keep 100% coverage, I tried to met that standard and cover as many lines of code as possible.
Widget testing was a little more complex to exectute correctly, especially since it's the very first time I approach to it. It's very possible that my exectution of the widget tests is not great in this project (I had some issues awaiting some of the animations to be finished), but I'm very interested to take on this part of testing and master it as soon as possible.

## Possible improvements and implementations

- Optimization for bigger devices, like tablet and desktop.
- Optimization on smaller device screens, particularly in the scrolling experience.
- Optimization of the visual elements contained in the CurrentWeatherSectionView by creating separate widgets for each section or macro element of the view.
- Image loader or a proper placeholder on network images
- Adding a dark mode.
- Adding a settings menu to change parameters like theme and images.
- Adding a favorite cities section and wrap the app in PageView to switch between cities' weather.
- Adding localization to automatically detect the position of the user and show it as the default weather.

These are some of the implementations that I excluded from the development for the sake of time, as well as some ideas I had to improve the app in the future.
