//
//  UIDevice+UDID.m
//  SmartUtil
//
//  Created by roki on 2018/5/14.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#import "UIDevice+UDID.h"
#import "NSString+Util.h"

@implementation UIDevice (UDID)
+ (NSString *)deviceUDID {
    
    NSString *savedUDID =  su_noBlankString([self readUDID]);
    
    if (savedUDID.length < 1) {
        savedUDID = [self saveUDID];
    }
    
    return savedUDID;
}

+ (NSString *)readUDID {
    
    NSString *bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
    
    id ret = nil;
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (id)kSecClassGenericPassword,(id)kSecClass,
                                          bundleID, (id)kSecAttrService,
                                          bundleID, (id)kSecAttrAccount,
                                          (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
                                          nil];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", bundleID, e);
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return (NSString *)ret;
}

+ (NSString *)saveUDID {
    NSString *UDID = [NSUUID UUID].UUIDString;
    NSString *bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                          (id)kSecClassGenericPassword,(id)kSecClass,
                                          bundleID, (id)kSecAttrService,
                                          bundleID, (id)kSecAttrAccount,
                                          (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
                                          nil];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:UDID] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
    
    return UDID;
}

+ (BOOL)isPhonexSeries {
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
        if (mainWindow.safeAreaInsets.top > 20 || mainWindow.safeAreaInsets.left > 0 || mainWindow.safeAreaInsets.bottom > 0) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

@end
