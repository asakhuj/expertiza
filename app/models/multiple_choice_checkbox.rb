class MultipleChoiceCheckbox < QuizQuestion
  def edit(count)
  end

  def complete
    quiz_question_choices = QuizQuestionChoice.where(question_id: self.id)
    html = ""
    for i in 0..3
      txt = quiz_question_choices[i].txt
      html += "<input name = " + "\"#{self.id}[]\" "
      html += "id = " + "\"#{self.id}" + "_" + "#{i + 1}\" "
      html += "value = " + "\"#{quiz_question_choices[i].txt}\" "
      html += "type=\"checkbox\"/>"
      html += "#{i + 1}"
      html += "</br>"
    end
    html
  end

  def view_completed_question(user_answer)
    quiz_question_choices = QuizQuestionChoice.where(question_id: self.id)
    html = ''
    quiz_question_choices.each do |answer|
      if(answer.iscorrect)
          html += '<b>' + answer.txt + '</b> -- Correct <br>'
      end
    end
    html += '<br>Your answer is:'
    if user_answer[0].answer == 1
      html += '<img src="/assets/Check-icon.png"/><br>'
    else
      html += '<img src="/assets/delete_icon.png"/><br>'
    end
    user_answer.each do |answer|
      html += '<b>' + answer.comments.to_s + '</b><br>'
    end
    html += '<br><hr>'
    html.html_safe

  end
end
