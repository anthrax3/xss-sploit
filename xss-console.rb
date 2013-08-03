#!/usr/bin/env ruby
#
#
#


#
# Environment path settings
#
xss_base = File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__
XSSDIR = File.join(File.expand_path(File.dirname(xss_base)))
$:.unshift(File.join(File.expand_path(File.dirname(xss_base)), 'lib'))



require 'xss'



