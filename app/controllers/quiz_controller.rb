class QuizController < ApplicationController

    def index
    end

    def display_info
    end

    def show_question
        @something = "something fshjshfjsh"
        if  Score.find_by(user: current_user).track >= 10
            redirect_to quiz_result_path
        else
            @question = Question.order('RANDOM()').limit(1)[0]
            @option = @question.options
        end
    end

    def submit_answer
        puts params
        question_id = params[:id]   
        user_answer = params[:option]

        currrent_question = Question.find_by(id:question_id)

        if currrent_question
            ans=currrent_question.answers[0].correct_answer
            @score = Score.find_by(user: current_user)
            if ans.to_s == user_answer
                @score.obtained += 1
            end
            @score.track += 1
            @score.save
        end
        redirect_to quiz_question_path
    end

    def result
        @score = Score.find_by(user: current_user)
        @user = User.find(current_user)
    end

end
