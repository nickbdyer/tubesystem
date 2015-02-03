#FAAST Tube System

[![Code
Climate](https://codeclimate.com/github/nickbdyer/tubesystem/badges/gpa.svg)](https://codeclimate.com/github/nickbdyer/tubesystem) [![Test Coverage](https://codeclimate.com/github/nickbdyer/tubesystem/badges/coverage.svg)](https://codeclimate.com/github/nickbdyer/tubesystem)

Week 1 Challenge at Maker's Academy

###The Problem, Domain Model

>In the FAAST system, there will be a number of **trains**. The **trains** can *move* from **station** to **station**. **Trains** are made up of a number of **carriages**. **Passengers** are able to *board* and *alight* **trains(carriages)**. 

>The **carriages** can hold up to 40 **passengers**. **Passengers** will need to *check in* and out at stations. Ultimately in order to check in they need to *have a certain amount of credit* on their card. The **train** will need to *move* and *stop*. 

>**Carriages** can be full or empty or somewhere in between. 
**Trains** can have a maximum number of **carriages** and a minimum. When a train is created it should have an option to define the *number of* **carriages** it has. 

>The tube system will need multiple **stations**, but assume that all **stations** are connected directly in a loop/one line. So all **stations** are available from every **station**. 

### Technologies and Principles

This project demonstrates implementation of OOP, TDD, Ruby, Git, RSpec. 

### Progress Checklist

The FAAST system will cater for the following:

- [x] There will be a number of trains inside the system.
- [x] Trains will travel from station to station.
- [x] Inside of a station, when the train stops, passengers will alight and enter the carriages of the train.
- [x] A Passenger will touch in at the station and touch out at the destination station.
- [x] Each coach of a train can hold up to 40 passengers.
- [x] Each train is made of a number of coaches.
- [x] **Bonus:** Add a charging system, so a passenger can only board if they have £2.

### The Solution

####Stages:

1. Building a domain model
2. Carriage
3. Train
4. Station
5. Passenger
6. Refactor

####CRC Cards

In trying to complete this challenge, I rushed ahead without making CRC cards. In hindsight, this was a mistake, since I ended up trying to mentally arrange the classes and methods in my head. I got myself into a muddle towards the middle of the project trying to determine where responsibilities lay. For the next project, I will not repeat this mistake. 


###Improvements
- The fixed relationship between the train and carriage created unnecessary complications. Obeying the SOLID Principles, I would like to remove this dependency. 
