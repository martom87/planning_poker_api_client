# frozen_string_literal: true

module DataProcessors
  class ReportGenerator

    def initialize(response:)
      @response = response
    end

    def call
      parse_response
    end

    private

    attr_reader :response

    def parse_response
      str = "Generating report"
      str += "\n"
      str += '-----------------'
      str += "\n"
      str += "#{members_votes}"
      str += "\n"
      str += "The average votes is #{response['votes_average']}"
      str += "\n"
      str += "#{response['message']}"
      str += "\n"
      str += '-----------------'
      str += "\n"
    end

    def members_votes
      arr = []
      hash_response = response['members_votes'].group_by {|_k, v| v}.each_with_object({}) {|(k, v), h| h[v.map(&:first)] = k}
      hash_response.each do |key, value|
        arr << "members: #{key.join(',')} voted: #{value}"
      end
      arr.join("\n")
    end

  end
end
