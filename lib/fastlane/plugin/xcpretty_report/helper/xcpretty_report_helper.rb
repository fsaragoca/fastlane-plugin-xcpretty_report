module Fastlane
  module Helper
    class XcprettyReportHelper
      # class methods that you define here become available in your action
      # as `Helper::XcprettyReportHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the xcpretty_report plugin helper!")
      end
    end
  end
end
