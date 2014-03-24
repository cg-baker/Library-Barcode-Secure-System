//
//  User.m
//  Library Barcode Secure System
//
//  Created by Chloe Baker on 12/7/13.
//  Copyright (c) 2013 CBaker. All rights reserved.
//

#import "User.h"
#import "LibraryDataBase.h"

@interface User ()

@property (nonatomic, strong) LibraryDataBase *library;

@end

@implementation User

- (BOOL) isAuthentic
{
    _isAuthentic = NO;
    
    //send the library my userID and barcodeID and ask am I authentic
    
    _isAuthentic = [self.library authenticUserWithID: self.userID withNumber: self.barcodeNumber];
    
    if (_isAuthentic) { // grab all the other libraryDatabase data
        
        NSMutableString *nameString;
        nameString = [NSMutableString stringWithString:self.library.libraryArray[1]];
        [nameString appendString: @" "];
        [nameString appendString:self.library.libraryArray[2]];
        self.name = nameString;
        
        //set books here, too, eventually!
        
    }
    
    return _isAuthentic;
    
    }

- (LibraryDataBase *) library
{
    if (!_library) _library = [[LibraryDataBase alloc] init];
    return _library;
}

@end
