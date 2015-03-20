//
//  MapLayer.m
//  ScrollingTMX
//
//  Created by Greg Meach on 3/20/15.
//  Copyright (c) 2015 MeachWare. All rights reserved.
/*
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "MapLayer.h"

@interface MapLayer () {
    CCTiledMap *map;
    CCNode *_mapNode;
    CGSize fullSize;
}
@end

@implementation MapLayer

-(void)didLoadFromCCB {
    fullSize = self.contentSize;
    
    map = [[CCTiledMap alloc] initWithFile:@"orthogonal-desert-large.tmx"];
    map.name = @"TMXMap";
    [_mapNode addChild:map];
    //NSLog(@"MapLayer _mapNode didLoadTMX");
}

-(CGSize)sizeForZoom:(float)zoom {
    CGSize newSize = CGSizeZero;
    if (zoom >= 0.99) { //100%
        newSize = fullSize;
    } else if (zoom >= 0.74) { //75%
        newSize = CGSizeMake((fullSize.width * 0.75),(fullSize.height * 0.75));
    } else if (zoom >= 0.49) { //50%
        newSize = CGSizeMake((fullSize.width * 0.5),(fullSize.height * 0.5));
    } else { //25%
        newSize = CGSizeMake((fullSize.width * 0.25),(fullSize.height * 0.25));
    }
    return newSize;
}

-(void)resetTMXScale:(float)scale {
    [self setContentSize:[self sizeForZoom:scale]];
    [map setScale:scale];
}

@end
