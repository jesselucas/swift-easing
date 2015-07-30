//
//  Easing.swift

//
//  Created by Jesse Lucas on 1/9/15.
//  Based on Robert Penner Easing Equations - http://robertpenner.com/easing/

import Foundation

struct Easing {
    // Linear
    static func noEasing(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        return c * t / d + b;
    }
    
    // Quintic
    static func easeInQuint(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        let newT:Double = t/d
        
        return c*(newT)*newT*newT*newT*newT + b;
    }
    
    // Sine
    static func easeInSine(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        return -c * cos(t/d * M_PI) + c + b;
    }
    
    static func easeOutSine(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        return c * sin(t/d * (M_PI/2)) + b;
    }
    
    static func easeInOutSine(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        return -c/2 * (cos(M_PI*t/d) - 1) + b;
    }
    
    // Exponential
    static func easeOutExpo(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b;
    }
    
    // Quadratic
    static func easeOutQuad(time t:Double, start b:Double, change c:Double, duration d:Double) -> Double {
        let newT:Double = t/d
        return -c * (newT) * (newT-2) + b;
    }
}

/*
TERMS OF USE - EASING EQUATIONS
---------------------------------------------------------------------------------
Open source under the BSD License.
Copyright © 2001 Robert Penner All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer. Redistributions in binary
form must reproduce the above copyright notice, this list of conditions and
the following disclaimer in the documentation and/or other materials provided
with the distribution. Neither the name of the author nor the names of
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------------
*/