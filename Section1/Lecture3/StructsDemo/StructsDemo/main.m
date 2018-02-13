//
//  main.m
//  StructsDemo
//
//  Created by pranav on 13/02/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import <Foundation/Foundation.h>

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
    }
    return 0;
}

float area(Circle aCircle) {
    return powf(M_PI * aCircle.radius, 2);
}

void newCircle(Circle *circle, int r, CGPoint c) {
    circle -> radius = r;
    circle -> center = CGPointMake(c.x, c.y);
}
