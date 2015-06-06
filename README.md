:page_facing_up: Boris Bikes Tutorial - 2nd part :page_facing_up:
===========
This is me re-doing and finishing the first tutorial from week 1 at Makers Academy, which I started with Massud [there](https://github.com/GBouffard/Boris-bikes-tutorial)

Objectives of exercise
----
The purpose of me re-doing it was to improve my understanding and knowledge of doubles and testing.

Results
----
In comparison to my first attempt, I managed to finish the exercise, understand new things and these are the passing tests:

```
Bike
  knows that it is working
  can break
  can be fixed once broken
  cannot be fixed if it is already working

DockingStation
  can have a default capacity
  can have a custom capacity
  has no bikes when created
  dock bikes
  raises an error when you re not docking a bike
  knows it has working bikes
  can release a bike

8 bikes station. 7 users take some. 2 come back broken
  van picks up the 2, get them fixed at garage and bring them back

Garage
  can dock a bike
  fixes a bike once docked
  releases a bike once fixed

Van
  can have a default capacity
  can have a custom capacity
  can load a bike
  should be able to collect broken bikes from a station
  should be able to remove broken bikes from a station when collecting
  should be able to drop off bikes to a garage
  should remove bikes from self once dropped off
  should be able to drop off fixed bikes to a station
  should be able to collect fixed bikes from a garage
```