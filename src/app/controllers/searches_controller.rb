# frozen_string_literal: true

class SearchesController < ApplicationController
  def new
    @search = Search.new
    @categories = ChuckNorrisApi.categories
  end

  def text
    @search = Search.new(search_type: 'text')
  end

  def category
    @search = Search.new(search_type: 'category')
    @categories = ChuckNorrisApi.categories
  end

  def random
    @search = Search.new(search_type: 'random')
  end

  def create
    @search = Search.new(search_params)

    if @search.save
      @search.execute_search

      # Send email if provided
      if @search.email.present?
        begin
          FactsMailer.search_results(@search).deliver_now
          flash[:notice] = t('search.email_sent')
        rescue StandardError => e
          # Log the error but don't fail the request
          Rails.logger.error("Error sending email: #{e.message}")
          flash[:alert] = "Error al enviar el email: #{e.message}"
        end
      end

      redirect_to(@search)
    else
      @categories = ChuckNorrisApi.categories if @search.search_type == 'category'
      render @search.search_type.to_sym
    end
  end

  def show
    @search = Search.find(params[:id])
    @facts = @search.facts.page(params[:page]).per(5)
  end

  def categories
    @categories = ChuckNorrisApi.categories
    render json: @categories
  end

  private

  def search_params
    params.require(:search).permit(:query, :search_type, :email)
  end
end
