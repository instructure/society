require "thor"
require "society"

module Society

  class CLI < Thor

    desc "from [-f FORMAT] [-o OUTPUT_PATH] PATHS_TO_FILES...", "Run dependency analysis on PATHS_TO_FILES..."
    long_desc <<-LONGDESC
      `PATHS_TO_FILES...` is a list of files to analyze. Can specify directories
      and/or files. For directories, all *.rb files found in the directory tree
      get included. Wildcards (e.g. `*`) are not currently supported.\n\n
      Example: society from -f json -o ./society_data.json app/models app/services
    LONGDESC

    method_option :format, :type => :string, :default => 'html', :aliases => "-f", :desc => "Output format; json or html"
    method_option :output, :type => :string, :aliases => "-o", :desc => "Output path; default for html is ./doc/society, default for json is STDOUT"

    def from(path, *more_paths) # need initial non-splatted arg to get Thor to fail gracefully when no args are passed
      paths = [path] + more_paths
      Society.new(*paths).report(format, options['output'])
    end

    private

    def format
      options['format'] && options['format'].to_sym
    end

  end

end
