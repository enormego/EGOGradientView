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

@interface EGOGradientView (Private)
@property(nonatomic,readonly,retain) CAGradientLayer* layer;
@end


@implementation EGOGradientView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)setColors:(NSArray *)newColors {
	NSMutableArray* normalizedColors = [[NSMutableArray alloc] initWithCapacity:newColors.count];
	
	for(id color in newColors) {
		if([color isKindOfClass:[UIColor class]]) {
			[normalizedColors addObject:(id)[(UIColor*)color CGColor]];
		} else {
			[normalizedColors addObject:color];
		}
	}
	
	NSLog(@"Setting: %@ | %@ | %@ | %@", normalizedColors, newColors, self, self.layer);
	self.layer.colors = normalizedColors;
	[normalizedColors release];
}

- (NSArray*)colors {
	NSMutableArray* uiColors = [[NSMutableArray alloc] initWithCapacity:self.layer.colors.count];
	
	for(id cgColor in self.layer.colors) {
		[uiColors addObject:[UIColor colorWithCGColor:(CGColorRef)cgColor]];
	}
	
	NSArray* colors = [NSArray arrayWithArray:uiColors];
	[uiColors release];
	
	return colors;
}

- (void)setLocations:(NSArray *)locations {
	self.layer.locations = locations;
}

- (NSArray*)locations {
	return self.layer.locations;
}

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

- (void)setType:(NSString *)type {
	self.layer.type = type;
}

- (NSString*)type {
	return self.layer.type;
}

+ (Class)layerClass {
	return [CAGradientLayer class];
}

- (void)dealloc {
    [super dealloc];
}


@end
