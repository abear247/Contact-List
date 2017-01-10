//
//  InputCollector.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "InputCollector.h"
#import "Contact.h"

@implementation InputCollector

- (NSString *)inputFromPrompt:(NSString *)promptString{
    char inputChars[255];
    fgets(inputChars,255,stdin);
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    if ([inputString  isEqualToString: @"quit"])
        return 0;
    if ([inputString isEqualToString:@"new"]){
        return @"new";
    }
        
    return inputString;
    
}


@end
