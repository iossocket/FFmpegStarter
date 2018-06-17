//
//  CommonUtils.m
//  FFmpegStarter
//
//  Created by XueliangZhu on 6/16/18.
//  Copyright © 2018 iossocket. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

+(NSString *)bundlePath:(NSString *)fileName {
    return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:fileName];
}

+(NSString *)documentsPath:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

@end
