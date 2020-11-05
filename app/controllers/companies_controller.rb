# frozen_string_literal: true

class CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = current_user.companies
  end

  def show
    @cash_transactions = @company.cash_transactions
  end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = current_user.companies.new(company_params)
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :country)
  end
end
