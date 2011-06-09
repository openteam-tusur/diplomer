# encoding: utf-8

class DiplomasController < CrudController
  def pdf
    @diploma = Diploma.find(params[:id])
    @student = Student.find(@diploma.student)
    @speciality = Speciality.find(@diploma.speciality)
    respond_to do |format|
      format.pdf do
        render :pdf => "#{@diploma}-#{@diploma.student}",
               :page_size => 'A3',
               :orientation => 'Landscape',
               :dpi => '300',
               :show_as_html  => params.has_key?(:debug),
               :margin => {:top => '0',
                           :right => '0',
                           :bottom => '0',
                           :left => '0'}
      end
    end
  end
end
