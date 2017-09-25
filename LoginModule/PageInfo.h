//
//  PageInfo.h
//  Auidable
//
//  Created by akshay bansal on 8/6/17.
//  Copyright © 2017 akshay bansal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageInfo : NSObject

@property (nonatomic,copy) NSString* title;
@property (nonatomic,copy) NSString* message;
@property (nonatomic,copy) NSString* imageName;


-(id)initWithTitle:(NSString *)title imageName:(NSString *)imagename message:(NSString *)message;

@end
