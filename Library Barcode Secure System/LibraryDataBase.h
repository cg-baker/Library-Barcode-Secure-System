//
//  LibraryDataBase.h
//  LibraryDataBase
//
//  Created by Jim B on 12/10/13.
//  Copyright (c) 2013 Jim B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibraryDataBase : NSObject

@property (strong, nonatomic) NSArray *libraryArray;

// given a student ID and barcode number, return YES if authentic and no if not

- (BOOL) authenticUserWithID: (NSString *) ID withNumber: (NSString *) barcodeNumber;

@end
