//
//  ExtensionProtocol.h
//
//  Created by jeffery on 2016-7-31.
//

#define extensionProtocol(NAME) \
interface NAME ## TemporaryClass : NSObject < NAME > {} \
@end \
@implementation NAME ## TemporaryClass \
\
