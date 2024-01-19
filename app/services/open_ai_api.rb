class OpenAiApi
    def self.chat(color_info, desk_work, desk_place)
        @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
        @client.chat(
            parameters: {
                model: "gpt-4",
                max_tokens: 250,
                messages: [
                {
                    role: "system", content: "You are a professional who diagnoses desk environments in terms of how color affects human desk work."
                },
                {
                    role: "user", content: 
                    "Please provide diagnostic results of your desk environment under the following conditions

                    # Conditions
                    Output is always less than 250 tokens.
                    No numerical RGB values are output(output with specific color names[red, blue, green, yellow, orange, purple, brown, white, black, gray, yellowish green, and light blue]is acceptable).
                    Color dominance of the desk environment diagnosed: #{color_info}.

                    # Output the following in one sentence in a gentle tone.
                    ・What are the good and bad points of the current desk environment for human work?
                    ・Please suggest improvements to further improve the work efficiency of #{desk_work} in terms of color.
                    ・Please add a few words at the end to say that you hope the work efficiency will improve."
                }
                ]
            }
        )
    end
end
