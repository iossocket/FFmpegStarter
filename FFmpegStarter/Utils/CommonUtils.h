//
//  CommonUtils.h
//  FFmpegStarter
//
//  Created by XueliangZhu on 6/16/18.
//  Copyright © 2018 iossocket. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject

+(NSString *)bundlePath:(NSString *)fileName;
+(NSString *)documentsPath:(NSString *)fileName;

@end
