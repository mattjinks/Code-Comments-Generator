class CommentsController < ApplicationController
    include ActionController::Live

    def generate
        puts "Starting generate method"
        response.headers['Content-Type'] = 'text/event-stream'
        response.headers['Cache-Control'] = 'no-cache'

        begin
            code = params[:code]
            puts "Received code: #{code}"
      
            CommentGenerator.generate(code) do |comment_part|
                puts "Received comment part: #{comment_part}"
                # response.stream.write "data: response from server"
                # sse = SSE.new(response.stream, event: "message")
                # sse.write({ message: 'Hi there' })
                response.stream.write comment_part
            end
        rescue => e
            puts "Error ocurred: #{e.message}"
            response.stream.write "data: Error occurred: #{e.message}\n\n"
        ensure
            puts "Closing response stream"
            response.stream.close
        end
    end
end
