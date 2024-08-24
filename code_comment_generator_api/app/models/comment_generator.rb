class CommentGenerator
  def self.generate(code)
    puts "starting CommentGenerator model"
    # openai_response = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'], log_errors: true).chat(
    #   parameters: {
    #       model: "gpt-4o-mini", 
    #       messages: [
    #           {
    #             role: "user",
    #             content: "Write a comment for the following code:\n`\n#{code}\n`"
    #           }
    #         ],
    #       max_tokens: 500,
    #       n: 1,
    #       stop: nil,
    #       temperature: 0.5          
          
    #   }
    # )

    # puts openai_response.inspect 

    # openai_response['choices'][0]['message']['content'].strip

    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'], log_errors: true)

    client.chat(
      parameters: {
        model: "gpt-4o", # Required.
        messages: [{ role: "user", content: "Write a comment for the following code:\n`\n#{code}\n`"}], # Required.
        temperature: 0.7,
        stream: proc do |chunk|
          puts "Received chunk in CommentGenerator: #{chunk}"
          comment_part = chunk.dig("choices", 0, "delta", "content")
          puts "In CommentGenerator, comment_part: #{comment_part}"
          yield comment_part if block_given?
          #print comment_part
        end
      }
    )
  end
end