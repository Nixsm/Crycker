# Crycker

A simple app that fetches the top 10 crypto coins from [here](https://coinmarketcap.com/api/), and displays them on a List.

## Considerations

The app was implemented using the VIPER architecture, I've used VIPER because it's my day-to-day architecture and a I didn't want to use dependencies.

I have implemented tests for the main module(the one who display the top 10 cryptos) and decided to not implement tests for the `CoinDetail` Module, since it consists in only display a crypto fetched by the `MainModule`.

The URL Request is implemented using the `URLRequest` class and its cache, the app also implements background fetch to update the cache.

For the `CryptoCoin` model, I'm using Swift 4 Codable.

## Run

The app contains no dependencies, simply open up the `.xcodeproj` and run the app.
