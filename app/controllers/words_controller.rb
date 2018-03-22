class WordsController < ApplicationController

  def index
    @words = Word.all
  end

  def new
    @word = current_user.words.new  
  end

  def create
    @word = current_user.words.create(word_params)
    if @word.save
     redirect_to words_path
    else
      render 'new'
    end
  end

  def update
    @word = current_user.words.find(params[:id])
    
    if @word.update(word_params)
      redirect_to edit_word_path
      flash[:alert] = "Слово успешно изменено!"
    else 
      render 'edit'
    end
  end

  def destroy
    @word = current_user.words.find(params[:id]).destroy  
    redirect_to root_path
  end

  # def show
  # end

  def edit
    @word = current_user.words.find(params[:id])
  end
  
  private

  def word_params
    params.require(:word) .permit(:en, :ru)
  end

end