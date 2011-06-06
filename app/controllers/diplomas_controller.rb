# encoding: utf-8

class DiplomasController < CrudController
  def pdf
    @diploma = Diploma.find(params[:id])
    @student = Student.find(@diploma.student)
    respond_to do |format|
      format.pdf do
        render :pdf => "#{@diploma}-#{@diploma.student}",
               :page_size => 'A3',
               :orientation => 'Landscape',
               :dpi => '600',
               :margin => {:top => '2cm',
                           :right => '1.7cm',
                           :bottom => '3cm',
                           :left => '1.7cm'}
      end
    end
  end
end
