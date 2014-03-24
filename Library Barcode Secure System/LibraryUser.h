//
//  LibraryUser.h
//  LibraryDataBase
//
//  Created by Jim B on 12/10/13.
//  Copyright (c) 2013 Jim B. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LibraryUser : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic, strong) NSString *studentID;
@property (nonatomic,strong) NSString *libraryID;
@property (nonatomic, strong) NSMutableArray *books;

@end
