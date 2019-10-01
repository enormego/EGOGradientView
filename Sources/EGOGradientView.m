//
//  EGOGradientView.m
//  EGOGradientView
//
//  Created by Shaun Harrison on 11/13/09.
//  Copyright (c) 2009-2019 enormego
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

EGOGradientViewType EGOGradientViewTypeAxial = nil;
EGOGradientViewType EGOGradientViewTypeRadial = nil;
EGOGradientViewType EGOGradientViewTypeConic = nil;

@implementation EGOGradientView

+ (void)initialize {
	EGOGradientViewTypeAxial = kCAGradientLayerAxial;
	EGOGradientViewTypeRadial = kCAGradientLayerRadial;

	if(@available(tvOS 12.0, *)) {
		EGOGradientViewTypeConic = kCAGradientLayerConic;
	} else {
		// Fallback on earlier versions
	}
}

#pragma mark - Colors

- (void)setColors:(NSArray<UIColor*>*)colors {
	NSMutableArray* normalizedColors = [[NSMutableArray alloc] initWithCapacity:colors.count];
	
	for(UIColor* color in colors) {
		[normalizedColors addObject:(id)color.CGColor];
	}

	self.layer.colors = normalizedColors;
}

- (NSArray<UIColor*>*)colors {
	NSArray* cgColors = self.layer.colors;
	NSMutableArray* uiColors = [[NSMutableArray alloc] initWithCapacity:cgColors.count];
	
	for(id cgColor in cgColors) {
		UIColor* uiColor = [[UIColor alloc] initWithCGColor:(CGColorRef)cgColor];
		[uiColors addObject:uiColor];
	}
	
	return [NSArray arrayWithArray:uiColors];
}

#pragma mark - Locations

- (void)setLocations:(NSArray*)locations {
	self.layer.locations = locations;
}

- (NSArray*)locations {
	return self.layer.locations;
}

#pragma mark - Points

- (void)setStartPoint:(CGPoint)point {
	self.layer.startPoint = point;
}

- (CGPoint)startPoint {
	return self.layer.startPoint;
}

- (void)setEndPoint:(CGPoint)point {
	self.layer.endPoint = point;
}

- (CGPoint)endPoint {
	return self.layer.endPoint;
}

#pragma mark - Type

- (void)setType:(EGOGradientViewType)type {
	self.layer.type = type;
}

- (EGOGradientViewType)type {
	return self.layer.type;
}

#pragma mark - Layer

- (CAGradientLayer*)layer {
	return (CAGradientLayer*)[super layer];
}

+ (Class)layerClass {
	return [CAGradientLayer class];
}

@end
