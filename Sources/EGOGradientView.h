//
//  EGOGradientView.h
//  EGOGradientView
//
//  Created by Shaun Harrison on 11/13/09.
//  Copyright (c) 2009-2018 enormego
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

//! Project version number for EGOGradientView.
FOUNDATION_EXPORT double EGOGradientViewVersionNumber;

//! Project version string for EGOGradientView.
FOUNDATION_EXPORT const unsigned char EGOGradientViewVersionString[];

NS_SWIFT_NAME(GradientViewType)
typedef NSString* EGOGradientViewType NS_EXTENSIBLE_STRING_ENUM;

FOUNDATION_EXPORT _Nonnull EGOGradientViewType EGOGradientViewTypeAxial;

/*
 * EGOGradientView works as a straight pass through to
 * CAGradientLayer, with the exception of the "colors" property.
 * The colors property allows you to send UIColor objects, as well as CGColorRefs,
 * and will always return an NSArray of UIColor objects.
 */

NS_SWIFT_NAME(GradientView)
@interface EGOGradientView : UIView

@property(nonatomic,strong,nonnull,readonly) CAGradientLayer* layer;

/* The array of UIColor objects defining the color of each gradient
 * stop. Defaults to nil. Animatable. */
@property(nonatomic,copy,nullable) NSArray<UIColor*>* colors;

/* An optional array of NSNumber objects defining the location of each
 * gradient stop as a value in the range [0,1]. The values must be
 * monotonically increasing. If a nil array is given, the stops are
 * assumed to spread uniformly across the [0,1] range. When rendered,
 * the colors are mapped to the output colorspace before being
 * interpolated. Defaults to nil. Animatable. */
@property(nonatomic,copy,nullable) NSArray<NSNumber*>* locations;

/* The start and end points of the gradient when drawn into the layer's
 * coordinate space. The start point corresponds to the first gradient
 * stop, the end point to the last gradient stop. Both points are
 * defined in a unit coordinate space that is then mapped to the
 * layer's bounds rectangle when drawn. (i.e. [0,0] is the bottom-left
 * corner of the layer, [1,1] is the top-right corner.) The default values
 * are [.5,0] and [.5,1] respectively. Both are animatable. */
@property(nonatomic) CGPoint startPoint;
@property(nonatomic) CGPoint endPoint;

/* The kind of gradient that will be drawn. */
@property(nonatomic,copy,nonnull) EGOGradientViewType type;
@end
