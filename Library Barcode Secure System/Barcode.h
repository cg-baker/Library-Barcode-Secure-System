//
//  Barcode.h
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/7/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Barcode : NSObject
@property (nonatomic) NSString *barcodeNumber;
@property UIImage *barcodeImage;
- (UIImage *) convertBarcodeNumber: (NSString *) barcodeNumber;

@end

