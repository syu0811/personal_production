class Admin::JobController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :edit, :new]
  before_action :attribute_jobs, only: [:index]
  before_action :attribute_job, only: [:edit, :update, :destroy]

  def index; end

  def edit; end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_job_index_path, notice: '作成に成功'
    else
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to admin_job_index_path, notice: '更新に成功'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy!
    redirect_to admin_job_index_path, notice: '削除に成功'
  end

  private

    def attribute_jobs
      @jobs = Job.all
    end

    def attribute_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name)
    end
end
