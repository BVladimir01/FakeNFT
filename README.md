# FakeNFTStore App

## Overview
An app for searching and purchasing fake nfts.

## Features
- Search and purchase NFTs
- Create and edit your profile
- Visit leaders' profiles
- Dark theme support
- Languge support (English, Russian)

## Tech Stack
- **Language:** Swift
- **Architecture:** MVVM
- **Frameworks:** SwiftUI, SwiftData, Kingfisher, ProgressHUD
- **Tools:** SPM, Tuist, SwiftLint

## Installation
```bash
git clone https://github.com/BVladimir01/FakeNFT
cd FakeNFT
tuist generate
open FakeNFT.xcodeproj
```

### Requirements
- Swift 6.x
- iOS 17+
- Xcode 16+

## Preview

|Profile|Catalog|Cart|Stats|
|:-----:|:-----:|:--:|:---:|
|<img src="PreviewGIFs/profile_dark.gif" width="150"/>|<img src="PreviewGIFs/Catalog-Dark-Russian.gif" width="150"/>|<img src="PreviewGIFs/screencast_cart_dark.gif" width="150"/>|<img src="PreviewGIFs/screencast_statistic_dark.gif" width="150"/>|

##  Project Structure

**Derived/** *tuist files* \
**iOS-FakeNFT-Extended/** \
├ **App/** *Top level app files* \
├ **Cart/** *Cart tab files* \
├ **Catalog/** *Catalog tab files* \
├ **Core/** *Core elements: UI elemtns, models, and services* \
├ **Profile/** *Profile tab files* \
├ **Statistics/** *Statistics tab files* \
**iOS-FakeNFT-ExtendedTests/** *Unit tests* \
**iOS-FakeNFT-ExtendedUITests/** *UI tests* \
**Resources/** *Images, localization* \
**xcconfigs/** *Config files*

## Future plan
- [ ] Use single design for models
- [ ] Add Unit tests
- [ ] Add UI tests
- [ ] Add documentation

## Acknowledgements
Big thanks to Yandex Practicum reviewers.


[cart_gif]: PreviewGIFs/screencast_cart.gif
[stats_gif]: PreviewGIFs/screencast_statistic_dark.gif 
[catalog_gif]: PreviewGIFs/Catalog-Dark-Russian.gif
[profile_gif]: PreviewGIFs/profile_dark.gif
