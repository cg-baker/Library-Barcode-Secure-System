//
//  User.h
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/7/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString * barcodeNumber;
@property (nonatomic) BOOL isAuthentic;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *books;

@end
