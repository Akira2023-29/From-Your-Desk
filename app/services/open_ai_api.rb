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
                    role: "system", content:  "You are an expert on the impact of color on desk work productivity. What is your advice on how to improve work productivity based on the color balance of a given desk environment?
                    # Conditions
                    Diagnosis based on GoogleCloudVisionAPI analysis results = 「color: score :pixelFraction」.
                    Answer within 200 characters.
                    These are some of the effects that each color has on desk work productivity
                    Red: symbolizes energy and vitality. Excessive use can cause aggression and stress.
                    Blue: Promotes calmness and concentration. Suitable for intellectual work with a rapid psychological time lapse.
                    Green: brings relaxation and peace of mind and reduces stress. The green color of plants symbolizes productivity.
                    Yellow: symbolizes brightness and vitality and stimulates creativity. Too much can cause anxiety and irritability.
                    Pink: symbolizes relaxation and calmness.
                    Purple: symbolizes nobility and luxury and stimulates creativity.
                    Orange: symbolizes energy and vitality and stimulates creativity.
                    Brown: symbolizes stability and trust.
                    Black: symbolizes strength and professionalism. Overuse can cause feelings of oppression and negativity.
                    White: symbolizes cleanliness and simplicity, reduces visual distractions and improves concentration."
                },
                {
                    role: "user", content: "Based on the color balance of the given desk environment, briefly tell us about your 「color balance assessment」 and 「advice for improving desk productivity」!
                    # Results of the color balance analysis of the desk environment
                    (=#{color_info})"
                }
                ]
            }
        )
    end
end