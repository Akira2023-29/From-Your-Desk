class OpenAiApi
    def self.chat(color_info, desk_work, desk_place)
        @client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])
        @client.chat(
            parameters: {
                model: "gpt-3.5-turbo",
                max_tokens: 300,
                temperature: 0.3,
                messages: [
                {
                    role: "system", content: 
                    "#Conditions.
                    ・You are the most knowledgeable person in the world about the impact of color on desk productivity.
                    ・This is the result of image analysis by GoogleCloudVisionAPI: 「color:score:pixelFraction」.
                    ・You are an expert in providing color perspective improvement ideas that will explode productivity at your desk.
                    ・Please also provide advice on how to improve this desk worker's main desk work (#{desk_work}).
                    ・Please give us advice on how to improve the work environment of the desk considering the location of the desk (#{desk_place}) from a color perspective (e.g., offices are company property, so large scale improvements are difficult; cafes are stores, so major changes are difficult; your own home, such as a study, is easy to improve, etc., please be sure to consider this).
                    ・Please limit your diagnosis to 250 characters.

                    # How each color affects productivity at your desk
                    Red: Red symbolizes vitality and energy and attracts attention. Excessive use, however, can cause aggression and stress.
                    Blue: Blue symbolizes knowledge, power, and reliability, and can increase focus. Excessive use, however, can cause feelings of loneliness and coldness.
                    Green: Green symbolizes stability and peace, and has relaxation and stress-reducing effects. Excessive use, however, can cause boredom and a sense of stillness.
                    Yellow: Yellow symbolizes brightness and vitality and stimulates creativity. Yellow also gives the image of 「light」 or 「sun」 and is believed to improve concentration, judgment, and memory.
                    Pink: Pink symbolizes love and tenderness and provides a sense of security. Excessive use, however, can cause weakness and helplessness.
                    Purple: Purple symbolizes nobility and luxury and stimulates creativity. Purple also has positive elements such as 「nobility, mystery, healing, rebirth, tenderness, maturity, delicacy, and artistic sense」 and 「negative elements such as fatigue, conflict, stress, depression, anxiety」 and loneliness.
                    Orange: Orange symbolizes energy and vitality and stimulates creativity. Orange also increases appetite, brings out a cheerful mood, and gives energy and openness.
                    Brown: Brown symbolizes stability and reliability and provides a sense of security. However, excessive use can cause boredom and a state of non-excitement13.
                    Black: Black symbolizes power and professionalism, but excessive use can cause feelings of depression and negativity. Black is also considered a color that promotes deep introspection and thoughtfulness.
                    WHITE: White symbolizes cleanliness and simplicity, reduces visual clutter, and improves concentration. White also has the following psychological effects: it gives the impression of cleanliness, makes things seem lighter than they really are, gives a sense of beginning, reminds us not to make a mess, renews our mood, and gives a sense of spaciousness."
                },
                {
                    role: "user", content: 
                    "# Color information of the desk environment to be diagnosed
                    - #{color_info}
                    # Primary tasks at this desk.
                    - #{desk_work}
                    # Location of this desk environment
                    - #{desk_place}
                    # What you want diagnosed
                    Please diagnose the good and bad points of the current desk environment based on the color information from the image analysis.
                    In doing so, please provide suggestions for improvement that take into account the location of the desk (#{desk_place}).
                    First, please rate the bad points of the desk environment in incredibly harsh terms. After that, please specifically communicate the good points of the desk environment in incredibly complimentary terms from a color perspective, and in addition, please encourage advice on how to improve the work productivity of the main desk work, #{desk_work}, from a color perspective.
                    Please explain in detail why doing so will improve the work productivity of #{desk_work} in a way that makes sense for each task."
                }
                ]
            }
        )
    end
end