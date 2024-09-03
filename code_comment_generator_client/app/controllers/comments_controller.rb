require 'net/http'
class CommentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Last-Modified'] = Time.now.httpdate

    code_snippet = params[:code_snippet]
    uri = URI('http://localhost:3000/comment')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
    request.body = { code: code_snippet }.to_json

    sse = SSE.new(response.stream, event: "message")

    http.request(request) do |http_response|
      http_response.read_body do |chunk|
        sse.write(chunk)
      end
    end
  ensure
    sse.close if sse
  end
end
