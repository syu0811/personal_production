class Admin::StudentController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  before_action :attribute_students, only: [:index]
  before_action :attribute_student, only: [:edit, :update, :destroy]

  def index; end

  def edit; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_index_path, notice: '作成に成功'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to admin_student_index_path, notice: '更新に成功'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy!
    redirect_to admin_student_index_path, notice: '削除に成功'
  end

  private

    def attribute_students
      @students = Student.all
    end

    def attribute_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:firstname, :lastname, :birthdate, :number, :group_id)
    end
end
