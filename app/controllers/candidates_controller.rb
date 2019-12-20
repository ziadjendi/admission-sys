class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.sorted
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

end
