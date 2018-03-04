//
//  Geometry.h
//  StructsDemo
//
//  Created by pranav on 20/02/18.
//  Copyright © 2018 RB. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct {
    CGPoint start;
    CGPoint end;
}Line;


@interface Geometry : NSObject

@property (nonatomic, assign) Line line;

-(void)makeLineFrom:(CGPoint)startPoint to:(CGPoint)endPoint;
-(float)slope:(Line)aLine;
-(float)length:(Line)aLine;

@end
