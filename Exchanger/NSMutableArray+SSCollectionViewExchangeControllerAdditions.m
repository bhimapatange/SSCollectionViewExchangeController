//
//  NSMutableArray+SSCollectionViewExchangeControllerAdditions.m
//  Exchanger
//
//  Created by Murray Sagal on 1/10/2014.
//  Copyright (c) 2014 Signature Software. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.



#import "NSMutableArray+SSCollectionViewExchangeControllerAdditions.h"


@implementation NSMutableArray (SSCollectionViewExchangeControllerAdditions)

+ (void)exchangeObjectInArray:(NSMutableArray *)array       atIndex:(NSUInteger)index
       withObjectInOtherArray:(NSMutableArray *)otherArray  atIndex:(NSUInteger)indexInOtherArray {
    
    // Exchanges two objects that *can* be in different arrays.

    if (array == nil || otherArray == nil) return;
    if (index >= array.count) return;
    if (indexInOtherArray >= otherArray.count) return;
    
    if ([array isEqual:otherArray]) {
        
        [array exchangeObjectAtIndex:index withObjectAtIndex:indexInOtherArray];
        
    } else {

        id objectInArray      = array[ index ];
        id objectInOtherArray = otherArray[ indexInOtherArray ];
        
        [array      replaceObjectAtIndex:index              withObject:objectInOtherArray];
        [otherArray replaceObjectAtIndex:indexInOtherArray  withObject:objectInArray];
        
    }
}

// TODO: remove this
- (void)exchangeObjectAtIndex:(NSUInteger)indexInThisArray
       withObjectInOtherArray:(NSMutableArray *)otherArray
                      atIndex:(NSUInteger)indexInOtherArray {
    
    [NSMutableArray exchangeObjectInArray:self
                                  atIndex:indexInThisArray
                   withObjectInOtherArray:otherArray
                                  atIndex:indexInOtherArray];
    
}

@end
