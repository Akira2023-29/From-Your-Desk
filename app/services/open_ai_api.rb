class OpenAiApi
    def self.chat(color_info, desk_work)
        @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
        @client.chat(
            parameters: {
                model: "gpt-3.5-turbo",
                max_tokens: 250,
                temperature: 0.7,
                messages: [
                {
                    role: "system", content: 
                    "# Requirements.
                    ・You are familiar with the impact of color on desk productivity.
                    ・Information from GoogleCloudVisionAPI image analysis results: 「color:score:pixelFraction」.
                    ・You are an expert in providing improvement ideas from a color perspective that will bombard your desk with work productivity.
                    ・Please also send me advice on how to improve this desk worker's main desk task (#{desk_work}).

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
                    - #{color_info}
                    # Primary tasks at this desk.
                    - #{desk_work}
                    # What you want diagnosed 
                    Please diagnose the good and bad points of the current desk environment based on the color information of the image analysis. First, please tell us the bad points and critique them very badly. Then, tell them specifically from a color perspective that there are good points in their current desk, and encourage them from a color perspective to give advice on how to improve their work productivity in their main desk task, #{desk_work}. Please also explain in detail why doing so would specifically increase work efficiency. (Please answer within 250 characters)."
                }
                ]
            }
        )
    end
end