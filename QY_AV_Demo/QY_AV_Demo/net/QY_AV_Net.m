//
//  QY_AV_Net.m
//  QY_AV_Demo
//
//  Created by ihefe－hulinhua on 16/7/6.
//  Copyright © 2016年 ihefe_hlh. All rights reserved.
//

#import "QY_AV_Net.h"

@implementation QY_AV_Net

+ (void)reqSomeStingWithUrlstr:(NSString *)URL response:(NetResponse)responseddd
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url = [NSURL URLWithString:URL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!responseddd) return ;
            if (data) {
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (!dict) {
                    responseddd (NO,nil);
                }else
                {
                    NSArray *sidList = dict[@"videoSidList"];
                    NSArray *videoList = dict[@"videoList"];
                    
                    if (sidList && videoList) {
                        NSArray *datat = @[sidList,videoList];
                        responseddd (YES,datat);
                        
                    }else
                    {
                        responseddd (NO,nil);
                    }
                }
            }else
            {
                responseddd (NO,nil);
            }
        }];

        [task resume];
    });
    
}

@end
