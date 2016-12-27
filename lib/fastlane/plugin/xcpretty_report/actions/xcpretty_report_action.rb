module Fastlane
  module Actions
    class XcprettyReportAction < Action
      def self.run(params)
        log_file = File.join(params[:buildlog_path], 'xcodebuild.log')

        output_path = params[:output_path]
        unless File.exist?(output_path)
          Actions.sh("mkdir '#{output_path}'", log: $verbose)
        end

        reports = ''
        params[:types].each do |report|
          path = File.join(output_path, params[:name]) + "." + report
          reports << "--report '#{report}' --output '#{path}' "
        end
        Actions.sh("cat '#{log_file}' | bundle exec xcpretty #{reports}", log: $verbose)

        if params[:use_json_formatter]
          path = File.join(output_path, params[:name]) + ".json"
          Actions.sh("cat '#{log_file}' | XCPRETTY_JSON_FILE_OUTPUT='#{path}' bundle exec xcpretty -f `xcpretty-json-formatter`", log: $verbose)
        end
      end

      def self.description
        "xcpretty"
      end

      def self.authors
        ["fsaragoca"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :buildlog_path,
                                  env_name: "XCPRETTY_REPORT_BUILDLOG_PATH",
                               description: "Path for xcodebuild buildlog folder",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :output_path,
                                  env_name: "XCPRETTY_REPORT_OUTPUT_PATH",
                               description: "Path for output directory",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :name,
                                  env_name: "XCPRETTY_REPORT_NAME",
                               description: "Name for report – defaults to 'report'",
                                  optional: false,
                             default_value: 'report',
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :types,
                                  env_name: "XCPRETTY_REPORT_TYPES",
                               description: "Types of reports to generate",
                                  optional: false,
                             default_value: ['junit', 'html'],
                                      type: Array),
          FastlaneCore::ConfigItem.new(key: :use_json_formatter,
                                  env_name: "XCPRETTY_REPORT_JSON_FILE_OUTPUT",
                               description: "Outputs a report using 'xcpretty-json-formatter'",
                                  optional: true,
                                 is_string: false)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
