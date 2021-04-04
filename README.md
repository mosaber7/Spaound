# Spaound


> Find Co-Working spaces has become an easy task with us. Spaound helps you find the Co-Working spaces near you!

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Technologies](#technologies)
* [Inspiration](#inspiration)
* [Contact](#contact)

## General info
you can search for a specific Co-Working space you have in mind, or you surf all the Co-Working spaces we have in our App. the app supports Dark-Mode and localization.

the app is implemented using FireBase Authuintcation, Self-made custom RESTful API using "Mockoon", along side other 3rd-party libraries.  
## Screenshots


`Launch Screen and onboarding screens`


![onboarding](https://user-images.githubusercontent.com/52084438/113147122-be140280-9230-11eb-8eec-80997b7c259a.gif)


`Firebase Auth`


![Auth1](https://user-images.githubusercontent.com/52084438/113146619-2e6e5400-9230-11eb-9aa1-c7e080953d84.gif)

![auth2](https://user-images.githubusercontent.com/52084438/113148803-945bdb00-9232-11eb-897b-df95eab71b56.gif)


`Home Screens`


![HomeApp11](https://user-images.githubusercontent.com/52084438/113148190-da646f00-9231-11eb-8292-b483ee4c7039.gif)

![HomeApp12](https://user-images.githubusercontent.com/52084438/113148203-de908c80-9231-11eb-9b45-44707174f931.gif)

![HomeApp2](https://user-images.githubusercontent.com/52084438/113148829-9de54300-9232-11eb-8be7-57bb78fc61ca.gif)






## Technologies.

* Swift5, UIKit, Storyboard.
* MVC Pattern.
* Firebase Authentication, Firebase Database.
* self-made RESTfull API using `Mockoon`.
* Core Animation.
* UITableView, custom Cells.
* UICollectionView, custom Cells.
* Dark Mode.
* Localization & Generalization [English and Arabic].
 




## Inspiration
Project inspired by `Swifty-Camp`.
## Contact
Created by [@mosaber](https://www.linkedin.com/in/mohamed-saber-fares/) - feel free to contact me!



## sample Json responce used
`[
    {
      "name": "Omina Space",
      "address": "Qeft City, Qena",
      "beforeDiscountPrice": 250,
      "price": 180,
      "wifi": true,
      "rating": 5,
      "amenities":{
        "freeWifi": false,
        "libraryBook": true,
        "gamesRoom": true,
        "Coffee": false,
        "meetingRoom": true
      },
      "about": "Coworking is an arrangement in which workers of different companies share an office space",
      "availabiltyTimes":{
        "saturday":"8:00 AM - 12:00 AM",
        "sunday":"9:00 AM - 12:00 AM",
        "monday":"10:00 AM - 12:00 AM",
        "tuesday":"8:00 AM - 12:00 AM",
        "wednseday":"7:00 AM - 12:00 AM",
        "thurseday":"6:00 AM - 12:00 AM",
        "friday":"2:00 AM - 12:00 AM",
      },`
      
      "imageUrl": "https://egyptianstreets.com/wp-content/uploads/2020/10/79367016_1017878288546161_581926600698757120_o.jpg",
    }
    ]`
