//
//  BarcodeDisplayView.m
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/10/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import "BarcodeDisplayView.h"

@interface BarcodeDisplayView ()

@property (nonatomic, strong) NSMutableString *code39barcode;

@end

@implementation BarcodeDisplayView

- (void) setBarcode: (NSString *) barcode
{
    _barcode = barcode;
    
    self.code39barcode =  [NSMutableString stringWithCapacity: 150]; // initialize the code39barcode
    NSMutableString *asteriskBarcode = [NSMutableString stringWithCapacity: 20];
    
    // add an * to beginning and end
    
    
    [asteriskBarcode setString:barcode];
    [asteriskBarcode appendString:@"*"];
    [asteriskBarcode insertString:@"*" atIndex: 0];
    
    //check the barcode character by character and append the code 39 equivalent
    
    for (int index = 0; index<asteriskBarcode.length; index++)
    {
        NSRange nextCharacterRange = NSMakeRange(index,1);
        NSString *nextCharacter = [asteriskBarcode substringWithRange:nextCharacterRange];
        if ([nextCharacter isEqualToString:@"*"])
        {
            [self.code39barcode appendString: @"bWbwBwBwb"];
            
        } else if ([nextCharacter isEqualToString: @"A"])
        {
            [self.code39barcode appendString:@"BwbwbWbwB"];
            
        } else if ([nextCharacter isEqualToString: @"B"])
        {
            [self.code39barcode appendString:@"bwBwbWbwB"];
            
        } else if ([nextCharacter isEqualToString: @"C"])
        {
            [self.code39barcode appendString:@"BwBwbWbwb"];
            
        } else if ([nextCharacter isEqualToString:@"D"])
        {
            [self.code39barcode appendString:@"bwbwBWbwB"];
            
        } else if ([nextCharacter isEqualToString:@"E"])
        {
            [self.code39barcode appendString:@"BwbwBWbwb"];
            
        } else if ([nextCharacter isEqualToString: @"F"])
        {
            [self.code39barcode appendString:@"bwBwBWbwb"];
            
        } else if ([nextCharacter isEqualToString: @"G"])
        {
            [self.code39barcode appendString:@"bwbwbWBwB"];
            
        } else if ([nextCharacter isEqualToString: @"H"])
        {
            [self.code39barcode appendString:@"bwbwbWBwB"];
            
        } else if ([nextCharacter isEqualToString:@"I"])
        {
            [self.code39barcode appendString:@"bwBwbWBwb"];
            
        } else if ([nextCharacter isEqualToString:@"J"])
        {
            [self.code39barcode appendString:@"bwbwBWBwb"];
            
        } else if ([nextCharacter isEqualToString: @"K"])
        {
            [self.code39barcode appendString:@"BwbwbwbWB"];
            
        } else if ([nextCharacter isEqualToString: @"L"])
        {
            [self.code39barcode appendString:@"bwBwbwbWB"];
            
        } else if ([nextCharacter isEqualToString: @"M"])
        {
            [self.code39barcode appendString:@"BwBwbwbWb"];
            
        } else if ([nextCharacter isEqualToString:@"N"])
        {
            [self.code39barcode appendString:@"bwbwBwbWB"];
            
        } else if ([nextCharacter isEqualToString:@"O"])
        {
            [self.code39barcode appendString:@"BwbwBwbWb"];
            
        } else if ([nextCharacter isEqualToString: @"P"])
        {
            [self.code39barcode appendString:@"bwBwBwbWb"];
            
        } else if ([nextCharacter isEqualToString: @"Q"])
        {
            [self.code39barcode appendString:@"bwbwbwBWB"];
            
        } else if ([nextCharacter isEqualToString: @"R"])
        {
            [self.code39barcode appendString:@"BwbwbwBWb"];
            
        } else if ([nextCharacter isEqualToString:@"S"])
        {
            [self.code39barcode appendString:@"bwBwbwBWb"];
            
        } else if ([nextCharacter isEqualToString:@"T"])
        {
            [self.code39barcode appendString:@"bwbwBwBWb"];
        } else if ([nextCharacter isEqualToString: @"U"])
        {
            [self.code39barcode appendString:@"BWbwbwbwB"];
            
        } else if ([nextCharacter isEqualToString: @"V"])
        {
            [self.code39barcode appendString:@"bWBwbwbwB"];
            
        } else if ([nextCharacter isEqualToString: @"W"])
        {
            [self.code39barcode appendString:@"BWBwbwbwb"];
            
        } else if ([nextCharacter isEqualToString:@"X"])
        {
            [self.code39barcode appendString:@"bWbwBwbwB"];
            
        } else if ([nextCharacter isEqualToString:@"Y"])
        {
            [self.code39barcode appendString:@"BWbwBwbwb"];
            
        } else if ([nextCharacter isEqualToString: @"Z"])
        {
            [self.code39barcode appendString:@"bWBwBwbwb"];
            
        } else if ([nextCharacter isEqualToString: @"0"])
        {
            [self.code39barcode appendString:@"bwbWBwBwb"];
            
        } else if ([nextCharacter isEqualToString: @"1"])
        {
            [self.code39barcode appendString:@"BwbWbwbwB"];
            
        } else if ([nextCharacter isEqualToString:@"2"])
        {
            [self.code39barcode appendString:@"bwBWbwbwB"];
            
        } else if ([nextCharacter isEqualToString:@"3"])
        {
            [self.code39barcode appendString:@"BwBWbwbwb"];
            
        } else if ([nextCharacter isEqualToString: @"4"])
        {
            [self.code39barcode appendString:@"bwbWBwbwB"];
            
        } else if ([nextCharacter isEqualToString: @"5"])
        {
            [self.code39barcode appendString:@"BwbWBwbwb"];
            
        } else if ([nextCharacter isEqualToString: @"6"])
        {
            [self.code39barcode appendString:@"bwBWBwbwb"];
            
        } else if ([nextCharacter isEqualToString:@"7"])
        {
            [self.code39barcode appendString:@"bwbWbwBwB"];
            
        } else if ([nextCharacter isEqualToString:@"8"])
        {
            [self.code39barcode appendString:@"BwbWbwBwb"];
            
        } else if ([nextCharacter isEqualToString: @"9"])
        {
            [self.code39barcode appendString:@"bwBWbwBwb"];
            
        } else
        {
            [self.code39barcode appendString: @"BBBbbbbbb"];
        }
        
        
        [self.code39barcode appendString:@"w"];
        
    }
    [self setNeedsDisplay]; // call the display to draw
}



static const CGSize THICK_BAR = {50, 3};
static const CGSize THIN_BAR = {50, 1.5};

- (void)drawRect:(CGRect)rect
{
    
    CGRect barRect;
    
    barRect.origin.x = rect.size.width/2 - 25;
    barRect.origin.y = 0;
    
    for (int index = 0; index<self.code39barcode.length; index++)
    {
        NSRange nextCharacterRange = NSMakeRange(index,1);
        NSString *nextCharacter = [self.code39barcode substringWithRange:nextCharacterRange];
        
        if ([nextCharacter isEqualToString:@"b"])
        {
            barRect.size = THIN_BAR;
            [[UIColor blackColor] setFill];
            UIRectFill (barRect);
            barRect.origin.y = barRect.origin.y+1.5;
            
        } else if ([nextCharacter isEqualToString:@"B"])
        {
            barRect.size = THICK_BAR;
            [[UIColor blackColor] setFill];
            UIRectFill (barRect);
            barRect.origin.y = barRect.origin.y+3;
            
        } else if ([nextCharacter isEqualToString:@"w"])
        {
            barRect.size = THIN_BAR;
            [[UIColor whiteColor] setFill];
            UIRectFill (barRect);
            barRect.origin.y = barRect.origin.y+1.5;
            
        } else if ([nextCharacter isEqualToString:@"W"])
        {
            barRect.size = THICK_BAR;
            [[UIColor whiteColor] setFill];
            UIRectFill(barRect);
            barRect.origin.y = barRect.origin.y+3;
        }
        
    }
}

@end
