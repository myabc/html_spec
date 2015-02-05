require 'rspec'
require 'nokogiri/diff'

module HtmlSpec
  module Matchers
    class Matcher
      attr_reader :expected_html
      attr_reader :expected, :actual

      def diffable?
        true
      end

      def initialize(expected_html)
        @expected_html = expected_html
      end

      def matches?(actual_html)
        actual_doc   = normalize_and_parse(actual_html)
        expected_doc = normalize_and_parse(expected_html)

        actual_root   = actual_doc.at_xpath('/html/body')
        expected_root = expected_doc.at_xpath('/html/body')

        @actual   = actual_root.children.to_s
        @expected = expected_root.children.to_s

        actual_doc.tdiff_equal expected_doc
      end

      def description
        'equal HTML'
      end

      def failure_message
        # "expected #{match} to #{description}, but got #{actual}"
        "expected HTML to match #{actual}, but got #{expected}"
      end

      def failure_message_when_negated
        "expected HTML not to match #{actual}, but got #{expected}"
       end

      private

      HTML_OPTIONS = Nokogiri::XML::ParseOptions::DEFAULT_HTML | Nokogiri::XML::ParseOptions::NOBLANKS

      def normalize_and_parse(html_str)
        html_str.strip!
        Nokogiri::HTML(html_str, nil, nil, HTML_OPTIONS)
      end
    end

    def be_html_eql(html)
      HtmlSpec::Matchers::Matcher.new(html)
    end
  end
end
