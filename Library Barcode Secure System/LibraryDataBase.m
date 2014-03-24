//
//  LibraryDataBase.m
//  LibraryDataBase
//
//  Created by Jim B on 12/10/13.
//  Copyright (c) 2013 Jim B. All rights reserved.
//

#import "LibraryDataBase.h"
#import "LibraryUser.h"

@interface LibraryDataBase()

@property (strong, nonatomic)  NSMutableArray *users;

@end


@implementation LibraryDataBase // comm layer

- (instancetype) init
{
    self = [super init];
    
    // TEST LIBRARY DATABASE CODE V1
    /*if (self) { // let's add some users when we initialize
        
        NSArray *studentName = @[@"Angela Applebaum", @"Brian Barnum", @"Chris Coombs", @"David Donnegan", @"Eleanor Eaton", @"Fiona Fellows", @"Chloe Baker", @"Khanh Luong", @"Claire Toussaint"];

        NSArray *studentID = @[@"1111111", @"2222222", @"3333333", @"4444444", @"5555555", @"6666666", @"1368187", @"1352981", @"1539299"];
        NSArray *libraryID = @[@"1A1A1A1A1A1A1A", @"2B2B2B2B2B2B2B", @"3C3C3C3C3C3C3C", @"4D4D4D4D4D4D4D", @"5E5E5E5E5E5E5E", @"6F6F6F6F6F6F6F", @"P000001491627C", @"P000001495582G", @"P000001494384F"]; //list of IDs
        
        for (int index = 0; index<studentID.count; index++){ //loop through the following
            LibraryUser *user = [[LibraryUser alloc] init];
            user.name = studentName[index];
            user.studentID = studentID[index];
            user.libraryID = libraryID[index]; //pairs student names, student IDs with library IDs
            [self.users addObject:user]; //saves triplet to the "database"
        }
    } */
    
    return self;
}


- (BOOL) authenticUserWithID: (NSString *)ID withNumber: (NSString *)barcodeNumber
{
    
    BOOL isAuthentic = NO; //the default return value is always no
    
    
    // TEST LIBRARY DATABASE CODE V1
    /* for (LibraryUser *user in self.users) //for every user that is in the database, go through the following loop
    {
        if ([user.studentID isEqualToString:ID] && [user.libraryID isEqualToString:barcodeNumber]) //checking to see if inputted information matches the database
        {
        isAuthentic = YES; //if information matches return yes
        }
    } */
    
    NSMutableString *sentURLString = [NSMutableString stringWithCapacity: 150];
    [sentURLString setString: @"http://169.254.210.142/UserCheckID_Barcode.php?student_ID="];
    [sentURLString appendString: ID];
    [sentURLString appendString:@"&bar_code="];
    [sentURLString appendString:barcodeNumber];
    
    NSURL *sentURL = [NSURL URLWithString:sentURLString];
    NSData *libraryData = [NSData dataWithContentsOfURL: sentURL];
    NSString *libraryString = [[NSString alloc] initWithData:libraryData encoding:NSUTF8StringEncoding];
    self.libraryArray = [libraryString componentsSeparatedByString: @","];
    
    isAuthentic = [self.libraryArray[0] boolValue];
    
    if ([self.libraryArray[0]  isEqual: @"\n1"])
        isAuthentic = YES;
    return isAuthentic;
    
}

/* - (NSMutableArray *) users
{
    if (!_users) _users = [[NSMutableArray alloc]init];
    return _users; //initialize users if there isn't one
}
*/

@end