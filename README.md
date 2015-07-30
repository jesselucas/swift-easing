## Swift Easing Functions

### Supported functions
* Linear
* Sine

### Partially supported functions
* Quintic
* Exponential

### Usage Example
```swift
   var easedValue:Double = Easing.easeOutExpo(time: durationValue * percent, start: Double(fromValue), change: change, duration: durationValue)
```
    
For more detailed example see: https://github.com/jesselucas/UILabel-Animate.swift

##Inspiration
* Robert Penner (http://www.robertpenner.com/easing/)
