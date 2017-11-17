# ExtensionProtocol


	@protocol Printable

    @optional
	- (NSString *)desc;

	@end

	@extensionProtocol(Printable)

	- (NSString *)desc {
        return @"Default desc";
	}

	@end
