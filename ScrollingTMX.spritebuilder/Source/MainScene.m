//
//  MainScene.m
//  ScrollingTMX
//
//  Created by Greg Meach on 3/19/15.
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

#import "MainScene.h"
#import "MapLayer.h"

#define LOGGING 1   //Boolean to enable NSLogging

@interface MainScene () {
    MapLayer *mapLayer;
    CCNode *_scrollContentNode;
    float currentZoom;
}
@end

@implementation MainScene

-(void)didLoadFromCCB {
    currentZoom = 1.0;
    [self resetZoomLevel];
}

-(void)resetZoomLevel {
    if (LOGGING) NSLog(@"resetZoomLevel: %.2f",currentZoom);
    
    [_scrollContentNode removeAllChildrenWithCleanup:YES];
    
    mapLayer = (MapLayer*)[CCBReader load:@"MapLayer"];
    [mapLayer resetTMXScale:currentZoom];
    
    if (LOGGING) NSLog(@"mapLayer after setScale: %.0f x %.0f",mapLayer.contentSize.width,mapLayer.contentSize.height);
    
    CCScrollView *scrollView = [[CCScrollView alloc] initWithContentNode:mapLayer];
    scrollView.flipYCoordinates = NO;
    scrollView.name = @"ScrollView";
    
    [_scrollContentNode addChild:scrollView];
    scrollView.scrollPosition = ccp(0, 0);
}

-(void)zoomIn:(CCButton*)sender {
    if (currentZoom <= 0.26) {
        if (LOGGING) NSLog(@"at min zoom");
        return;
    }
    currentZoom -= 0.25;
    [self resetZoomLevel];
}

-(void)zoomOut:(CCButton*)sender {
    if (currentZoom >= 0.99) {
        if (LOGGING) NSLog(@"at max zoom");
        return;
    }
    currentZoom += 0.25;
    [self resetZoomLevel];
}


@end
