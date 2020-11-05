# frozen_string_literal: true

class CashTransactionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_cash_transaction, only: :destroy

  def create
    @cash_transaction = CashTransaction.new(cash_transaction_params)

    if @cash_transaction.save!
      redirect_to @cash_transaction.company,
                  notice: 'Transaction was successfully created.'
    else
      redirect_to @cash_transaction.company,
                  alert: 'Something went wrong'
    end
  end

  def destroy
    @cash_transaction.destroy
    redirect_to @cash_transaction.company,
                notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_cash_transaction
    @cash_transaction = CashTransaction.find(params[:id])
  end

  def cash_transaction_params
    params.require(:cash_transaction)
          .permit(:initial_cash, :cash_in, :cash_out,
                  :transaction_date, :company_id)
  end
end
