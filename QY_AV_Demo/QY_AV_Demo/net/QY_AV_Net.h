//
//  QY_AV_Net.h
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetResponse)(BOOL isSuccess,id data);

@interface QY_AV_Net : NSObject

+ (void)reqSomeStingWithUrlstr:(NSString *)URL response:(NetResponse)responseddd;

@end
