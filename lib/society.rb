require "haml"
require "json"
require "ripper"
require "fileutils"
require "active_support/core_ext/string/inflections"

require_relative "society/edge"
require_relative "society/node"
require_relative "society/object_graph"
require_relative "society/formatter/report/html"
require_relative "society/formatter/report/json"
require_relative "society/parser"
require_relative "society/version"

module Society

  def self.new(*paths_to_files)
    Society::Parser.for_files(*paths_to_files)
  end

end

