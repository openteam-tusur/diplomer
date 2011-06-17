# encoding: utf-8

class DiplomasController < CrudController
  def show
    show!{
      @course = @diploma.courses.new
      @paper = @diploma.papers.new
      @practice = @diploma.practices.new
    }
  end

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
