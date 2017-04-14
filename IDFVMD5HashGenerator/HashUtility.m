//
//  HashUtility.m
//  IDFVMD5HashGenerator
//
//  Created by 麻生 拓弥 on 2017/04/14.
//  Copyright © 2017年 麻生 拓弥. All rights reserved.
//

#import "HashUtility.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation HashUtility

/**
 * IDFVを取得しMD5ハッシュ値に変換したものを返す
 *
 * @return MD5ハッシュ値に変換されたIDFVの文字列
 */
+ (NSString*)hashedIDFVStr {

    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    return [self mdFiveHashGenerator:idfv];
}

/**
 * 文字列を受け取ってMD5ハッシュ値に変換する
 *
 * @param string MD5ハッシュ値に変更する対象文字列
 * @return 変換後のMD5ハッシュ値
 */
+ (NSString*)mdFiveHashGenerator:(NSString*)string {

    // MD5Hashに変換する
    NSMutableString *mdHashString = @"".mutableCopy;

    if (string.length != 0) {
        const char *data = [string UTF8String];
        CC_LONG len = (CC_LONG)strlen(data);
        unsigned char result[CC_MD5_DIGEST_LENGTH];
        CC_MD5(data, len, result);
        for (int i = 0; i < 16; i++) {
            [mdHashString appendFormat:@"%02X",result[i]];
        }
    } else {
        // 取得できなかった場合は空文字にする
        [mdHashString appendString:@""];
    }
    NSLog(@"MD5HashString: %@", mdHashString);

    return mdHashString;
}

@end
