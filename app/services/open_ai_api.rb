class OpenAiApi
    def self.chat(color_info)
        @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
        @client.chat(
            parameters: {
                model: "gpt-3.5-turbo",
                max_tokens: 180,
                temperature: 0.5,
                messages: [
                {
                    role: "system", content: 
                    "# Requirements.
                    ・You are familiar with the impact of color on desk productivity.
                    ∙ Information from GoogleCloudVisionAPI image analysis results: 「color:score:pixelFraction」.
                    ・You are an expert in providing improvement ideas from a color perspective that will bombard your desk with work productivity.
                    
                    # How each color affects productivity at your desk
                    Red: Symbol of energy and vitality. Overuse can cause aggression and stress.
                    Blue: enhances calmness and concentration. Good for intellectual work with a rapid psychological passage of time.
                    Green: brings relaxation and peace of mind and reduces stress. The green color of plants symbolizes productivity.
                    Yellow: symbolizes brightness and vitality and stimulates creativity. Too much can cause anxiety and irritability.
                    Pink: symbolizes relaxation and calmness.
                    Purple: symbolizes nobility and luxury and stimulates creativity.
                    Orange: symbolizes energy and vitality and stimulates creativity.
                    Brown: symbolizes stability and trust.
                    Black: symbolizes strength and professionalism. Overuse can cause feelings of oppression and negativity.
                    White: symbolizes cleanliness and simplicity, reduces visual clutter and improves concentration."
                },
                {
                    role: "user", content: 
                    "# Color information of the desk environment to be diagnosed
                    -#{color_info}
                    # Format of answers
                    [diagnostic results].
                    Based on the color information, how would you rate the current desk environment in terms of work productivity (what would you say the current desk environment is like?) (Please answer within 220 characters).
                    [Advice]
                    Please give us your advice on how to improve work productivity at your desk from a color perspective (please answer within 220 characters)"
                }
                ]
            }
        )
    end
end