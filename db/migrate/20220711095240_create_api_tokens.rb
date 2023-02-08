class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.uuid :token
      t.string :issued_to

      t.timestamps
    end
  end
end
