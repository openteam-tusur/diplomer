# encoding: utf-8

class DiplomasController < CrudController
  def pdf
    @diploma = Diploma.find(params[:id])
    @student = Student.find(@diploma.student)
    @speciality = Speciality.find(@diploma.speciality)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "#{@diploma}-#{@diploma.student}",
          :stylesheets => ["print"]
      end
    end
  end
end
