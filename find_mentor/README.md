<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/tree/master/find_mentor">
    <img src="ss/Logo1.png" alt="Logo" width="200">
  </a>

  <h3 align="center">Find Mentor</h3>

  <p align="center">
    Find & Match With Your Mentor/Mentee 
    <br />
    <a href="https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil">Download</a>
    ·
    <a href="https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/issues">Report Bug</a>
    ·
    <a href="https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/issues">Request Feature</a>
  </p>
</p>


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#api">API</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#clone">Clone</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#Screenshots">Version 1 Screenshots</a></li>
    <li><a href="#Screenshots">Screenshots</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project
Hello to everyone! If you are looking for a mentor or mentee, if you enjoy sharing your knowledge with others, if you want to meet and chat with like-minded people during the pandemic period, you can use the Find Mentor application. I developed the mobile version of Find Mentor using Flutter. You can take a look at the project and give feedback about the missing and wrong parts and contribute to the development process.

Meet -> Ask -> Listen -> Learn -> Change Your Career

- [x] App Structure (Updated)
- [x] Portrait Mode
- [x] Support Multiple Language (TR/EN)
- [x] Mentors Page (This part working very well because (Mentor Data < 400)) 
- [x] Mentees Page (I'm working on pagination part because I keep getting error and afterwards my application crash. (Mentee Data > 400)) (Solved)
- [x] Events Page 
- [x] Jobs Page (If you tap the company logo on the details page. You can go to the company website.)
- [x] Home Page
- [x] Mentee & Mentors GitHub README (HTML problem)

<!-- API -->
## API

**Get all persons by:**

```bash
curl https://findmentor.network/persons.json
```

**Get all active mentorships by:**

```bash
curl https://findmentor.network/activeMentorships.json
```

**Get all jobs:**

```bash
curl https://findmentor.network/jobs.json
```

<!-- GETTING STARTED -->
## 🚀 Getting Started

### Prerequisites

To run any Android application built with Flutter you need to configure the enviroments in your machine, you can do this following the the tutorial provided by Google in [Flutter website](https://flutter.dev/docs/get-started/install)

- Flutter SDK
- Android Studio (to download Android SDK)
- Xcode (for iOS develop only)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

### Clone

- Clone this repo to your local machine using:

```
git clone https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil.git
```

### Setup

To run the app you need to have an online emulator or a plugged device and run the following command in the root of the application.

#### Android
```
flutter run
``` 
### iOS (_MAC Only_)

```
flutter run
``` 

<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/issues) for a list of proposed features (and known issues).


<!-- CONTRIBUTING -->
## 🤔 Contributing (Feel free to contribute!)


Every night & every deploy, the spread sheet will be parsed by GitHub actions, then generate this beauty. Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- LICENSE -->
## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## 📌 Contact

- Linkedin at [Yunus Emre Alpu](https://www.linkedin.com/in/yunus-emre-alpu-5b1496151/)

<!-- SCREENSHOTS -->
## Version 1 Screenshots

Home Page               | Profile Page             | Profile Page               | Profile Page (HIRE ME!)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/v1_1.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/v1_2.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/v1_3.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/v1_4.png?raw=true)|


<!-- SCREENSHOTS -->
## Screenshots

Launcher Icons               | Splash Screen             | Splash Screen               | Splash Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/1.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/2.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/3.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/4.png?raw=true)|

Splash Screen            | Splash Screen               | Home Page               | Bottom Sheet
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/5.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/6.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/7.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/8.png?raw=true)|

How It Works?              |  Contact Us                | Follow Us                |  Feedback
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/9.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/10.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/11.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/12.png?raw=true)|

Home Page (Top)             | Home Page               | Home Page                |  Home Page (Bottom)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/45.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/46.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/47.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/48.png?raw=true)|

Events             | Jobs               | Mentors                |  Mentees
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/13.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/14.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/15.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/16.png?raw=true)|

Mentors Page (Top)             | Mentors Page               | Mentors Page                |  Mentors Page (Bottom)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/17.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/18.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/19.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/20.png?raw=true)|

Mentors Detail Page             | Mentors Detail Page               | Mentors Detail Page                |  Mentors Detail Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/37.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/38.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/39.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/40.png?raw=true)|

Mentees Page (Top)             | Mentees Page               | Mentees Page                |  Mentees Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/33.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/34.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/35.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/36.png?raw=true)|

Mentees Detail Page             | Mentees Detail Page               | Mentees Detail Page                |  Mentees Detail Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/41.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/42.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/43.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/44.png?raw=true)|

Mentees Detail Page             | Mentees Detail Page               | Mentees Detail Page                |  Mentees Detail Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/49.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/50.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/51.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/52.png?raw=true)|

Jobs Page (Top)             | Jobs Page               | Jobs Page                |  Jobs Page (Bottom)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/21.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/22.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/23.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/24.png?raw=true)|

Jobs Detail Page           | Jobs Detail Page               | Jobs Detail Page                |  Jobs Page Detail (Bottom)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/29.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/30.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/31.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/32.png?raw=true)|

Events Page (Top)             | Events Page               | Events Page                |  Events Page (Bottom)
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/25.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/26.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/27.png?raw=true)|![](https://github.com/YunusEmreAlps/Flutter_find-mentor-mobil/blob/master/find_mentor/ss/28.png?raw=true)|