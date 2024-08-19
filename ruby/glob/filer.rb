Dir['items/**/*'].select( &File.method(:file?) ).each { |f| `rclone copy #{f} service:items` }

# rclone copy common/uploads/items --include '*/*' service:items
