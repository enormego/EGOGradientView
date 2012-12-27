//
//  EGOGradientView.m
//  EGOGradientView
//
//  Created by Shaun Harrison on 11/13/09.
//  Copyright (c) 2009 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOGradientView.h"
#import <QuartzCore/QuartzCore.h>

#define _layer ((CAGradientLayer*)self.layer)

@implementation EGOGradientView
@dynamic colors, locations, startPoint, endPoint, type;

- (void)setColors:(NSArray *)newColors {
	NSMutableArray* normalizedColors = [[NSMutableArray alloc] initWithCapacity:newColors.count];
	
	for(id color in newColors) {
		if([color isKindOfClass:[UIColor class]]) {
			[normalizedColors addObject:(id)[(UIColor*)color CGColor]];
		} else {
			[normalizedColors addObject:color];
		}
	}

	_layer.colors = normalizedColors;
	
	#if !__has_feature(objc_arc)
		[normalizedColors release];
	#endif
}

- (NSArray*)colors {
	NSMutableArray* uiColors = [[NSMutableArray alloc] initWithCapacity:_layer.colors.count];
	
	for(id cgColor in _layer.colors) {
		[uiColors addObject:[UIColor colorWithCGColor:(CGColorRef)cgColor]];
	}
	
	NSArray* colors = [NSArray arrayWithArray:uiColors];

	#if !__has_feature(objc_arc)
		[uiColors release];
	#endif
	
	return colors;
}

- (void)setLocations:(NSArray *)locations {
	_layer.locations = locations;
}

- (NSArray*)locations {
	return _layer.locations;
}

- (void)setStartPoint:(CGPoint)point {
	_layer.startPoint = point;
}

- (CGPoint)startPoint {
	return _layer.startPoint;
}

- (void)setEndPoint:(CGPoint)point {
	_layer.endPoint = point;
}

- (CGPoint)endPoint {
	return _layer.endPoint;
}

- (void)setType:(NSString *)type {
	_layer.type = type;
}

- (NSString*)type {
	return _layer.type;
}

+ (Class)layerClass {
	return [CAGradientLayer class];
}

@end
