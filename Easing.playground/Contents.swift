//: Playground - noun: a place where people can play

//import CoreGraphics
//import Foundation
import UIKit

public protocol FloatingPointTrigonometric: FloatingPoint{
    var sine: Self {get}
    var cosine: Self {get}
}


extension Float : FloatingPointTrigonometric {
    public var sine : Float {return sin(self)}
    public var cosine : Float {return cos(self)}
}

extension Double : FloatingPointTrigonometric {
    public var sine : Double {return sin(self)}
    public var cosine : Double {return cos(self)}
}

extension CGFloat : FloatingPointTrigonometric {
    public var sine : CGFloat {return sin(self)}
    public var cosine : CGFloat {return cos(self)}
}




//extension CGFloat : FloatingPointTrigonometric {
//    var sine : CGFloat {return sin(self)}
//}


// <T: FloatingPoint & ExpressibleByFloatLiteral >


// Linear 


//   line y = x
public func linear <T: FloatingPoint> (_ x: T ) -> T{
    return x
}




// Quadratic

// parabola y = x^2
public func quadraticEaseIn <T: FloatingPoint> (_ x: T) -> T{
    return x * x
}


//  parabola y = -x^2 + 2x
public func quadraticEaseOut <T: FloatingPoint> (_ x: T) -> T{
    return -(x * (x - 2))
}

//  piecewise quadratic
// y = (1/2)((2x)^2)              [0, 0.5)
// y = -(1/2)((2x-1)*(2x-3) - 1)  [0.5, 1]
public func quadraticEaseInOut <T: FloatingPoint> (_ x: T  ) -> T{

    if x < 1/2{
        return 2 * x * x;
    }
    else{
        return (-2 * x * x) + (4 * x) - 1;
    }

}



// Cubic 

//   cubic y = x^3
public func  cubicEaseIn <T: FloatingPoint> (_ x: T  ) -> T{
    return x * x * x
}

//  cubic y = (x - 1)^3 + 1
public func cubicEaseOut <T: FloatingPoint> (_ x: T  ) -> T{
    let p = x - 1
    return  p * p * p + 1/1
}



//  piecewise cubic
// y = (1/2)((2x)^3)        [0, 0.5)
// y = (1/2)((2x-2)^3 + 2)  [0.5, 1]
public func cubicEaseInOut <T: FloatingPoint> (_ x: T  ) -> T{

    if(x < 1/2){
        return 4 * x * x * x
    }
    else
    {
        let f = ((2 * x) - 2)
        return 1/2 * f * f * f + 1
    }
}



// Quartic

// the quartic x^4
public func  quarticEaseIn <T: FloatingPoint> (_ x: T  ) -> T{
    return x * x * x * x
}


//   quartic y = 1 - (x - 1)^4
public func  quarticEaseOut <T: FloatingPoint> (_ x: T  ) -> T{
    let f = (x - 1)
    return f * f * f * (1 - x) + 1
}


//  piecewise quartic
// y = (1/2)((2x)^4)         [0, 0.5)
// y = -(1/2)((2x-2)^4 - 2)  [0.5, 1]
public func quarticEaseInOut <T: FloatingPoint> (_ x: T  ) -> T{
    if(x < 1/2){
        return 8 * x * x * x * x
    }
    else{
        let f = (x - 1)
        return -8 * f * f * f * f + 1
    }
}



// Quintic

//  quintic y = x^5
public func quinticEaseIn <T: FloatingPoint> (_ x: T  ) -> T{
    return x * x * x * x * x
}


//  quintic y = (x - 1)^5 + 1
public func quinticEaseOut <T: FloatingPoint> (_ x: T  ) -> T{
    let f = (x - 1)
    return f * f * f * f * f + 1/1
}

//  piecewise quintic
// y = (1/2)((2x)^5)      in  [0, 0.5]
// y = (1/2)((2x-2)^5 + 2) in [0.5, 1]
public func quinticEaseInOut <T: FloatingPoint> (_ x: T  ) -> T{

    if(x < 1/2){
        return 16 * x * x * x * x * x
    }
    else{
        let f = ((2 * x) - 2)
        return  1/2 * f * f * f * f * f + 1
    }
}


// Sine

//   quarter-cycle  sine wave
public func sineEaseIn <T: FloatingPointTrigonometric > (_ x: T  ) -> T{
  
        return (((x - 1) * T.pi/2).sine) + 1/1
}


//   quarter-cycle of sine wave
public func sineEaseOut <T: FloatingPointTrigonometric > (_ x: T  ) -> T{
    
    return (x * T.pi/2).sine
}

//  half sine wave
public func sineEaseInOut <T: FloatingPointTrigonometric > (_ x: T  ) -> T{
    
    return 1/2 * (1 - (x * T.pi).cosine)
}



// Circular

// shifted quadrant IV of unit circle
public func circularEaseIn <T: FloatingPoint > (_ x: T  ) -> T{
    
    return 1 - sqrt(1 - (x * x))
}


//  shifted quadrant II of unit circle
public func  circularEaseOut <T: FloatingPoint > (_ x: T  ) -> T{

    return sqrt((2 - x) * x)
}



// Piecewise circular function
// y = (1/2)(1 - sqrt(1 - 4x^2))            [0, 0.5)
// y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1)  [0.5, 1]
public func  circularEaseInOut <T: FloatingPoint > (_ x: T  ) -> T{
    if(x < 1/2){
        return 1/2 * (1 - sqrt(1 - 4 * (x * x)))
    }
    else{
        let f = -((2 * x) - 3) * ((2 * x) - 1)
        let g = sqrt( f )
        return 1/2 * ( g + 1 )
    }
}


// Exponencial

// exponential function y = 2^(10(x - 1))
//public func  exponentialEaseIn <T: FloatingPoint > (_ x: T  ) -> T{
//    return (x == 0) ? x : pow(2, 10 * (x - 1))
//}

let ff: Double = 0.0
let gg: Float = 0.5
let hh: CGFloat = 1.0
let yy =  pow(2,3)

//let t = circularEaseInOut(ff)



//func sine<T: FloatingPoint>(_ x: T) -> T {
//    switch x {
//        case is Double : return sin(x as! Double) as! T
//        case is Float : return sin(x as! Float) as! T
//        default: return 0 as T
//    }
//}



