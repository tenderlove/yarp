# frozen_string_literal: true

require "mkmf"
require "rbconfig"
require "rake"

include_dir = File.join __dir__, "include"
find_header("yarp.h", include_dir) or raise "yarp.h is required"

# Explicitly look for the extension header in the parent directory
# because we want to consistently look for yarp/extension.h in our
# source files to line up with our mirroring in CRuby.
find_header("yarp/extension.h", File.join(__dir__, "..")) or raise "yarp/extension.h is required"

create_makefile("yarp/yarp")
