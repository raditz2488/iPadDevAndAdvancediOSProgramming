//
//  main.m
//  StructsDemo
//
//  Created by pranav on 13/02/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Geometry.h"

typedef struct {
    int radius;
    CGPoint center;
}Circle;

float area(Circle aCircle);
void newCircle(Circle *circle, int r, CGPoint c);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Circle myCircle;
        
        //Initialize a myCircle
        CGPoint centerPoint = CGPointMake(2, -1);
        newCircle(&myCircle, 4, centerPoint);
        
        //print area of circle using powf which is floating point power function
        printf("area = %f\n", area(myCircle));
        
        CGPoint a = CGPointMake(2, 6);
        CGPoint b = CGPointMake(5, 2);
        
        Geometry *geo = [[Geometry alloc] init];
        [geo makeLineFrom:a to:b];
        printf("Slope = %f\n",[geo slope:geo.line]);
        printf("Length = %f\n",[geo length:geo.line]);
    }
    return 0;
}

float area(Circle aCircle) {
    float radiusSquare = powf(aCircle.radius, 2);
    return M_PI * radiusSquare;
}

void newCircle(Circle *circle, int r, CGPoint c) {
    circle -> radius = r;
    circle -> center = CGPointMake(c.x, c.y);
}
