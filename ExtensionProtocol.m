//
//  ExtensionProtocol.m
//
//  Created by jeffery on 2016-7-31.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

__attribute__((constructor)) static void _append_default_implement_method_to_class() {
    unsigned classCount;
    Class *classes = objc_copyClassList(&classCount);
    for (int i = 0; i < classCount; i ++) {
        Class class = classes[i];
        Class metaClass = object_getClass(class);
        
        unsigned protocolCount;
        Protocol * __unsafe_unretained *protocols = class_copyProtocolList(class, &protocolCount);
        for (int j = 0; j < protocolCount; j ++) {
            Protocol *protocol = protocols[j];
            NSString *tempClassName = [NSString stringWithFormat:@"%sTemporaryClass", protocol_getName(protocol)];
            Class tempClass = objc_getClass(tempClassName.UTF8String);
            if (!tempClass) continue;
            
            unsigned methodCount;
            Method *methods = class_copyMethodList(tempClass, &methodCount);
            for (int k = 0; k < methodCount; k ++) {
                Method method = methods[k];
                class_addMethod(class, method_getName(method), method_getImplementation(method), method_getTypeEncoding(method));
            }
            free(methods);
            
            Class metaTempClass = object_getClass(tempClass);
            unsigned metaMethodCount;
            Method *metaMethods = class_copyMethodList(metaTempClass, &metaMethodCount);
            for (int k = 0; k < metaMethodCount; k ++) {
                Method method = metaMethods[k];
                class_addMethod(metaClass, method_getName(method), method_getImplementation(method), method_getTypeEncoding(method));
            }
            free(metaMethods);
        }
        free(protocols);
    }
    free(classes);
}
