//
//  InputCollector.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputFromPrompt:(NSString *)promptString{
    if ([promptString  isEqualToString: @"quit"])
        return 0;
    if ([promptString isEqualToString:@"new"]){
        
    }
        
    return promptString;
    
}


@end
