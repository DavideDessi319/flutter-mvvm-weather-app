class MockData {
  static const String currentWeatherJSON = '''
      {
        "coord": {
          "lon": -0.1278,
          "lat": 51.5074
        },
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 25.03,
          "feels_like": 24.89,
          "temp_min": 23.12,
          "temp_max": 26.12,
          "pressure": 1018,
          "humidity": 50
        },
        "visibility": 10000,
        "wind": {
          "speed": 3.6,
          "deg": 140
        },
        "clouds": {
          "all": 0
        },
        "dt": 1652794638,
        "sys": {
          "type": 2,
          "id": 2019646,
          "country": "GB",
          "sunrise": 1652760363,
          "sunset": 1652816878
        },
        "timezone": 3600,
        "id": 2643743,
        "name": "London",
        "cod": 200
      }
    ''';

  static const String forecastJSON = '''
      {
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
      {
        "dt": 1652799600,
        "main": {
          "temp": 25.11,
          "feels_like": 24.98,
          "temp_min": 23.82,
          "temp_max": 25.11,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1013,
          "humidity": 50,
          "temp_kf": 1.29
        },
        "weather": [
          {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
          }
        ],
        "clouds": {
          "all": 0
        },
        "wind": {
          "speed": 5.32,
          "deg": 155,
          "gust": 8.38
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-17 15:00:00"
      },
      {
        "dt": 1652810400,
        "main": {
          "temp": 22.96,
          "feels_like": 22.83,
          "temp_min": 18.67,
          "temp_max": 22.96,
          "pressure": 1017,
          "sea_level": 1017,
          "grnd_level": 1012,
          "humidity": 58,
          "temp_kf": 4.29
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 23
        },
        "wind": {
          "speed": 5.88,
          "deg": 166,
          "gust": 13.87
        },
        "visibility": 10000,
        "pop": 0.35,
        "rain": {
          "3h": 0.15
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-17 18:00:00"
      },
      {
        "dt": 1652821200,
        "main": {
          "temp": 19.09,
          "feels_like": 19.14,
          "temp_min": 16.08,
          "temp_max": 19.09,
          "pressure": 1017,
          "sea_level": 1017,
          "grnd_level": 1013,
          "humidity": 80,
          "temp_kf": 3.01
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10n"
          }
        ],
        "clouds": {
          "all": 36
        },
        "wind": {
          "speed": 3.32,
          "deg": 174,
          "gust": 9.1
        },
        "visibility": 10000,
        "pop": 0.7,
        "rain": {
          "3h": 0.76
        },
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-17 21:00:00"
      },
      {
        "dt": 1652832000,
        "main": {
          "temp": 14.39,
          "feels_like": 14.31,
          "temp_min": 14.39,
          "temp_max": 14.39,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 93,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03n"
          }
        ],
        "clouds": {
          "all": 46
        },
        "wind": {
          "speed": 3.43,
          "deg": 224,
          "gust": 8.36
        },
        "visibility": 10000,
        "pop": 0.46,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-18 00:00:00"
      },
      {
        "dt": 1652842800,
        "main": {
          "temp": 12.09,
          "feels_like": 11.7,
          "temp_min": 12.09,
          "temp_max": 12.09,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 90,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 61
        },
        "wind": {
          "speed": 3.35,
          "deg": 242,
          "gust": 9.03
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-18 03:00:00"
      },
      {
        "dt": 1652853600,
        "main": {
          "temp": 12.71,
          "feels_like": 12.15,
          "temp_min": 12.71,
          "temp_max": 12.71,
          "pressure": 1021,
          "sea_level": 1021,
          "grnd_level": 1018,
          "humidity": 81,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03d"
          }
        ],
        "clouds": {
          "all": 50
        },
        "wind": {
          "speed": 3.45,
          "deg": 246,
          "gust": 8.19
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-18 06:00:00"
      },
      {
        "dt": 1652864400,
        "main": {
          "temp": 16.86,
          "feels_like": 16.17,
          "temp_min": 16.86,
          "temp_max": 16.86,
          "pressure": 1021,
          "sea_level": 1021,
          "grnd_level": 1018,
          "humidity": 60,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 80
        },
        "wind": {
          "speed": 3.24,
          "deg": 226,
          "gust": 5.13
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-18 09:00:00"
      },
      {
        "dt": 1652875200,
        "main": {
          "temp": 20.21,
          "feels_like": 19.41,
          "temp_min": 20.21,
          "temp_max": 20.21,
          "pressure": 1021,
          "sea_level": 1021,
          "grnd_level": 1018,
          "humidity": 43,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 90
        },
        "wind": {
          "speed": 3.87,
          "deg": 202,
          "gust": 5.81
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-18 12:00:00"
      },
      {
        "dt": 1652886000,
        "main": {
          "temp": 19.93,
          "feels_like": 19.15,
          "temp_min": 19.93,
          "temp_max": 19.93,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 45,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 4.21,
          "deg": 188,
          "gust": 5.05
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-18 15:00:00"
      },
      {
        "dt": 1652896800,
        "main": {
          "temp": 18.17,
          "feels_like": 17.5,
          "temp_min": 18.17,
          "temp_max": 18.17,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 56,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 3.02,
          "deg": 168,
          "gust": 5.34
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-18 18:00:00"
      },
      {
        "dt": 1652907600,
        "main": {
          "temp": 15.49,
          "feels_like": 15.16,
          "temp_min": 15.49,
          "temp_max": 15.49,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 79,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10n"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.41,
          "deg": 177,
          "gust": 2.64
        },
        "visibility": 10000,
        "pop": 0.62,
        "rain": {
          "3h": 0.39
        },
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-18 21:00:00"
      },
      {
        "dt": 1652918400,
        "main": {
          "temp": 14.45,
          "feels_like": 14.43,
          "temp_min": 14.45,
          "temp_max": 14.45,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 95,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 501,
            "main": "Rain",
            "description": "moderate rain",
            "icon": "10n"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.7,
          "deg": 305,
          "gust": 2.62
        },
        "visibility": 8851,
        "pop": 1,
        "rain": {
          "3h": 3.58
        },
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-19 00:00:00"
      },
      {
        "dt": 1652929200,
        "main": {
          "temp": 13.71,
          "feels_like": 13.64,
          "temp_min": 13.71,
          "temp_max": 13.71,
          "pressure": 1017,
          "sea_level": 1017,
          "grnd_level": 1014,
          "humidity": 96,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10n"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.62,
          "deg": 4,
          "gust": 4.06
        },
        "visibility": 10000,
        "pop": 0.98,
        "rain": {
          "3h": 1.62
        },
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-19 03:00:00"
      },
      {
        "dt": 1652940000,
        "main": {
          "temp": 13.87,
          "feels_like": 13.74,
          "temp_min": 13.87,
          "temp_max": 13.87,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 93,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.57,
          "deg": 345,
          "gust": 2.71
        },
        "visibility": 10000,
        "pop": 0.94,
        "rain": {
          "3h": 0.34
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-19 06:00:00"
      },
      {
        "dt": 1652950800,
        "main": {
          "temp": 16.53,
          "feels_like": 16.22,
          "temp_min": 16.53,
          "temp_max": 16.53,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1015,
          "humidity": 76,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 98
        },
        "wind": {
          "speed": 1.9,
          "deg": 338,
          "gust": 2.43
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-19 09:00:00"
      },
      {
        "dt": 1652961600,
        "main": {
          "temp": 20.59,
          "feels_like": 20.04,
          "temp_min": 20.59,
          "temp_max": 20.59,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 51,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 83
        },
        "wind": {
          "speed": 2.09,
          "deg": 284,
          "gust": 3.16
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-19 12:00:00"
      },
      {
        "dt": 1652972400,
        "main": {
          "temp": 19.3,
          "feels_like": 18.72,
          "temp_min": 19.3,
          "temp_max": 19.3,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 55,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 96
        },
        "wind": {
          "speed": 2.61,
          "deg": 277,
          "gust": 3.03
        },
        "visibility": 10000,
        "pop": 0.02,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-19 15:00:00"
      },
      {
        "dt": 1652983200,
        "main": {
          "temp": 18.84,
          "feels_like": 18.42,
          "temp_min": 18.84,
          "temp_max": 18.84,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 63,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 95
        },
        "wind": {
          "speed": 1.99,
          "deg": 233,
          "gust": 2.8
        },
        "visibility": 10000,
        "pop": 0.28,
        "rain": {
          "3h": 0.13
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-19 18:00:00"
      },
      {
        "dt": 1652994000,
        "main": {
          "temp": 14.64,
          "feels_like": 14.22,
          "temp_min": 14.64,
          "temp_max": 14.64,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 79,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 94
        },
        "wind": {
          "speed": 2.16,
          "deg": 225,
          "gust": 5.11
        },
        "visibility": 10000,
        "pop": 0.08,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-19 21:00:00"
      },
      {
        "dt": 1653004800,
        "main": {
          "temp": 13.27,
          "feels_like": 12.66,
          "temp_min": 13.27,
          "temp_max": 13.27,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 77,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 94
        },
        "wind": {
          "speed": 1.83,
          "deg": 225,
          "gust": 4.45
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-20 00:00:00"
      },
      {
        "dt": 1653015600,
        "main": {
          "temp": 12.87,
          "feels_like": 11.96,
          "temp_min": 12.87,
          "temp_max": 12.87,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 67,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.59,
          "deg": 213,
          "gust": 4.7
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-20 03:00:00"
      },
      {
        "dt": 1653026400,
        "main": {
          "temp": 12.91,
          "feels_like": 12.03,
          "temp_min": 12.91,
          "temp_max": 12.91,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 68,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 2.61,
          "deg": 266,
          "gust": 5.96
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-20 06:00:00"
      },
      {
        "dt": 1653037200,
        "main": {
          "temp": 13.58,
          "feels_like": 12.9,
          "temp_min": 13.58,
          "temp_max": 13.58,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 73,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 2.51,
          "deg": 218,
          "gust": 5.25
        },
        "visibility": 10000,
        "pop": 0.26,
        "rain": {
          "3h": 0.36
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-20 09:00:00"
      },
      {
        "dt": 1653048000,
        "main": {
          "temp": 15.45,
          "feels_like": 14.85,
          "temp_min": 15.45,
          "temp_max": 15.45,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 69,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 88
        },
        "wind": {
          "speed": 4.2,
          "deg": 212,
          "gust": 7.13
        },
        "visibility": 10000,
        "pop": 0.02,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-20 12:00:00"
      },
      {
        "dt": 1653058800,
        "main": {
          "temp": 16.15,
          "feels_like": 15.73,
          "temp_min": 16.15,
          "temp_max": 16.15,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 73,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 86
        },
        "wind": {
          "speed": 5.3,
          "deg": 239,
          "gust": 9.38
        },
        "visibility": 10000,
        "pop": 0.67,
        "rain": {
          "3h": 1.09
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-20 15:00:00"
      },
      {
        "dt": 1653069600,
        "main": {
          "temp": 15.93,
          "feels_like": 15.51,
          "temp_min": 15.93,
          "temp_max": 15.93,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 74,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 67
        },
        "wind": {
          "speed": 5.42,
          "deg": 233,
          "gust": 9.72
        },
        "visibility": 10000,
        "pop": 0.67,
        "rain": {
          "3h": 0.58
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-20 18:00:00"
      },
      {
        "dt": 1653080400,
        "main": {
          "temp": 13.17,
          "feels_like": 12.84,
          "temp_min": 13.17,
          "temp_max": 13.17,
          "pressure": 1019,
          "sea_level": 1019,
          "grnd_level": 1016,
          "humidity": 88,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10n"
          }
        ],
        "clouds": {
          "all": 34
        },
        "wind": {
          "speed": 4.88,
          "deg": 242,
          "gust": 11.4
        },
        "visibility": 10000,
        "pop": 0.49,
        "rain": {
          "3h": 0.2
        },
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-20 21:00:00"
      },
      {
        "dt": 1653091200,
        "main": {
          "temp": 11.46,
          "feels_like": 10.99,
          "temp_min": 11.46,
          "temp_max": 11.46,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 89,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 801,
            "main": "Clouds",
            "description": "few clouds",
            "icon": "02n"
          }
        ],
        "clouds": {
          "all": 17
        },
        "wind": {
          "speed": 4.32,
          "deg": 255,
          "gust": 11.49
        },
        "visibility": 10000,
        "pop": 0.22,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-21 00:00:00"
      },
      {
        "dt": 1653102000,
        "main": {
          "temp": 9.98,
          "feels_like": 8.4,
          "temp_min": 9.98,
          "temp_max": 9.98,
          "pressure": 1021,
          "sea_level": 1021,
          "grnd_level": 1018,
          "humidity": 93,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 802,
            "main": "Clouds",
            "description": "scattered clouds",
            "icon": "03n"
          }
        ],
        "clouds": {
          "all": 38
        },
        "wind": {
          "speed": 3.16,
          "deg": 255,
          "gust": 9.37
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-21 03:00:00"
      },
      {
        "dt": 1653112800,
        "main": {
          "temp": 10.99,
          "feels_like": 10.42,
          "temp_min": 10.99,
          "temp_max": 10.99,
          "pressure": 1022,
          "sea_level": 1022,
          "grnd_level": 1019,
          "humidity": 87,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 69
        },
        "wind": {
          "speed": 2.53,
          "deg": 259,
          "gust": 4.51
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-21 06:00:00"
      },
      {
        "dt": 1653123600,
        "main": {
          "temp": 15.05,
          "feels_like": 14.33,
          "temp_min": 15.05,
          "temp_max": 15.05,
          "pressure": 1023,
          "sea_level": 1023,
          "grnd_level": 1020,
          "humidity": 66,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 99
        },
        "wind": {
          "speed": 2.45,
          "deg": 248,
          "gust": 3.22
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-21 09:00:00"
      },
      {
        "dt": 1653134400,
        "main": {
          "temp": 18.65,
          "feels_like": 17.88,
          "temp_min": 18.65,
          "temp_max": 18.65,
          "pressure": 1022,
          "sea_level": 1022,
          "grnd_level": 1019,
          "humidity": 50,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 92
        },
        "wind": {
          "speed": 1.93,
          "deg": 245,
          "gust": 2.67
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-21 12:00:00"
      },
      {
        "dt": 1653145200,
        "main": {
          "temp": 20.14,
          "feels_like": 19.36,
          "temp_min": 20.14,
          "temp_max": 20.14,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 44,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 90
        },
        "wind": {
          "speed": 2.19,
          "deg": 236,
          "gust": 2.81
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-21 15:00:00"
      },
      {
        "dt": 1653156000,
        "main": {
          "temp": 19.16,
          "feels_like": 18.46,
          "temp_min": 19.16,
          "temp_max": 19.16,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 51,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 82
        },
        "wind": {
          "speed": 1.7,
          "deg": 227,
          "gust": 1.82
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-21 18:00:00"
      },
      {
        "dt": 1653166800,
        "main": {
          "temp": 14.54,
          "feels_like": 14.01,
          "temp_min": 14.54,
          "temp_max": 14.54,
          "pressure": 1020,
          "sea_level": 1020,
          "grnd_level": 1017,
          "humidity": 75,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 60
        },
        "wind": {
          "speed": 1.06,
          "deg": 212,
          "gust": 1.68
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-21 21:00:00"
      },
      {
        "dt": 1653177600,
        "main": {
          "temp": 14.27,
          "feels_like": 13.68,
          "temp_min": 14.27,
          "temp_max": 14.27,
          "pressure": 1018,
          "sea_level": 1018,
          "grnd_level": 1015,
          "humidity": 74,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 80
        },
        "wind": {
          "speed": 0.89,
          "deg": 88,
          "gust": 1.13
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-22 00:00:00"
      },
      {
        "dt": 1653188400,
        "main": {
          "temp": 14.08,
          "feels_like": 13.4,
          "temp_min": 14.08,
          "temp_max": 14.08,
          "pressure": 1016,
          "sea_level": 1016,
          "grnd_level": 1013,
          "humidity": 71,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04n"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.53,
          "deg": 59,
          "gust": 3.23
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "n"
        },
        "dt_txt": "2022-05-22 03:00:00"
      },
      {
        "dt": 1653199200,
        "main": {
          "temp": 13.44,
          "feels_like": 12.41,
          "temp_min": 13.44,
          "temp_max": 13.44,
          "pressure": 1015,
          "sea_level": 1015,
          "grnd_level": 1012,
          "humidity": 60,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.47,
          "deg": 71,
          "gust": 2.33
        },
        "visibility": 10000,
        "pop": 0,
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-22 06:00:00"
      },
      {
        "dt": 1653210000,
        "main": {
          "temp": 14.48,
          "feels_like": 13.63,
          "temp_min": 14.48,
          "temp_max": 14.48,
          "pressure": 1014,
          "sea_level": 1014,
          "grnd_level": 1011,
          "humidity": 63,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 2.34,
          "deg": 64,
          "gust": 3.39
        },
        "visibility": 10000,
        "pop": 0.4,
        "rain": {
          "3h": 0.3
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-22 09:00:00"
      },
      {
        "dt": 1653220800,
        "main": {
          "temp": 13.24,
          "feels_like": 12.81,
          "temp_min": 13.24,
          "temp_max": 13.24,
          "pressure": 1015,
          "sea_level": 1015,
          "grnd_level": 1011,
          "humidity": 84,
          "temp_kf": 0
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }
        ],
        "clouds": {
          "all": 100
        },
        "wind": {
          "speed": 1.43,
          "deg": 64,
          "gust": 2.99
        },
        "visibility": 10000,
        "pop": 0.58,
        "rain": {
          "3h": 0.38
        },
        "sys": {
          "pod": "d"
        },
        "dt_txt": "2022-05-22 12:00:00"
      }
    ],
    "city": {
      "id": 2643743,
      "name": "London",
      "coord": {
        "lat": 51.5085,
        "lon": -0.1257
      },
      "country": "GB",
      "population": 1000000,
      "timezone": 3600,
      "sunrise": 1652760362,
      "sunset": 1652816878
    }
  }
  ''';
}
