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
                    "# Responses
                    Please provide diagnostic results of your desk environment under the following conditions

                    # Conditions
                    Output must always be less than 200 tokens.
                    The RGB value numbers are replaced by specific color names in the output and the RGB value numbers are not output.
                    Color information of the desk environment to be diagnosed: #{color_info}.
                    Primary tasks at this desk: #{desk_work}.
                    Location of this desk environment: #{desk_place}.

                    # output
                    Evaluate how well the desk environment is suited for working from a color balance perspective (within 100 tokens).
                    Considering the desk location (#{desk_place}), suggest improvements to improve the work efficiency of #{desk_work} from a color perspective (within 100 tokens).
                    (Consideration of desk location means that it is easier to change the environment at home than in the office, etc.)"
                }
                ]
            }
        )
    end
end
