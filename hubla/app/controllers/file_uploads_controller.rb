class FileUploadsController < ApplicationController
  def new
    @files = current_user.files.paginate(page: params[:page], per_page: 15)
  end

  def create
    FileService.new(current_user, params[:user][:files]).parse

    redirect_to root_path
  end
end
