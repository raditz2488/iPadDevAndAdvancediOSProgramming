//
//  Geometry.m
//  StructsDemo
//
//  Created by pranav on 20/02/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import "Geometry.h"

@implementation Geometry
@synthesize line;

-(void)makeLineFrom:(CGPoint)startPoint to:(CGPoint)endPoint {
    line.start = CGPointMake(startPoint.x, startPoint.y);
    line.end = CGPointMake(endPoint.x, endPoint.y);
}

-(float)slope:(Line)aLine {
    float rise = self.line.end.y - self.line.start.y;
    float run = self.line.end.x - self.line.start.x;
    if (run == 0.0f) {
        return NAN;
    } else {
        return rise / run;
    }
}

-(float)length:(Line)aLine {
    float rise = self.line.end.y - self.line.start.y;
    float run = self.line.end.x - self.line.start.x;
    return sqrtf(rise * rise + run * run);
}

@end
