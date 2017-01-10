//
//  main.m
//  Contact List
//
//  Created by Alex Bearinger on 2017-01-10.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *collector = [[InputCollector alloc]init];
        Contact *contact = [[Contact alloc]init];
        contact.name = [collector inputFromPrompt:@"Enter your username:"];
        contact.email = [collector inputFromPrompt:@"Enter your email:"];
        
        
        
    }
    return 0;
}
