## Swift Easing Functions

### Supported functions
* Linear
* Sine

### Partially supported functions
* Quintic
* Exponential

### Usage Example
```swift
public extension UILabel {
    public func animate(from fromValue:Int, to toValue:Int, duration durationValue:Double = 0.4, useTimeFormat useTimeFromatValue:Bool = false, numberFormatter numberFormatterValue:NSNumberFormatter! = nil, appendText appendTextValue:String = "") {
        
        self.text = String(fromValue.hashValue)
        
        let interval:Double = 10/30
        let nsec:UInt64 = UInt64(interval) * NSEC_PER_SEC
        let dispatchTime:dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(nsec))
        var previousProgress:NSTimeInterval = 0
        var progress:NSTimeInterval = 0
        var lastUpdate:NSTimeInterval = NSDate.timeIntervalSinceReferenceDate();
        var displayValue:Double = Double(fromValue)
        var percent:Double = 0
        var now:NSTimeInterval = 0
        
        //create timer
        timers.createTimer(key: self)
        
        func update() {
            now = NSDate.timeIntervalSinceReferenceDate()
            progress += now - lastUpdate
            lastUpdate = now
            
            if (progress >= durationValue) {
                dispatch_source_cancel(timers.getTimer(key: self))
                timers.removeTimer(key: self)
                progress = durationValue;
            }
            
            let percent = progress / durationValue
            let change:Double = Double(toValue) - Double(fromValue)
            
            
            var easedValue:Double = Easing.easeOutExpo(time: durationValue * percent, start: Double(fromValue), change: change, duration: durationValue)
            
            if (useTimeFromatValue == true) {
                self.text = Int(easedValue).time + appendTextValue
            } else {
                if (numberFormatterValue != nil) {
                    self.text = numberFormatterValue.stringFromNumber(easedValue)! + appendTextValue
                } else {
                    self.text = "\(Int(easedValue))\(appendTextValue)"
                }
            }
        }
        
        dispatch_source_set_timer(timers.getTimer(key: self), dispatchTime, nsec, 0)
        dispatch_source_set_event_handler(timers.getTimer(key: self), update)
        
        //start timer
        dispatch_resume(timers.getTimer(key: self))
        
        //call update right away
        update()
    }
}
```

##Inspiration
* Robert Penner (http://www.robertpenner.com/easing/)
