# frozen_string_literal: true

class ChangeTypeColumnPriceInTableBooks < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.change :price, :decimal, precision: 8, scale: 2
    end
  end
end
