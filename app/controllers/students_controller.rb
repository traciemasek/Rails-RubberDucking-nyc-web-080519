class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @ducks = @student.ducks
  end

  def new
    @student = Student.new  
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      flash.now[:messages] = @student.errors.full_messages[0]
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      flash.now[:messages] = @student.errors.full_messages[0]
      render :edit
    end
  end

  private 

  def student_params
    params.require(:student).permit(:name, :mod)
  end

end
