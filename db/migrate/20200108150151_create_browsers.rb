class CreateBrowsers < ActiveRecord::Migration[5.2]
  def change
    create_table :browsers do |t|
      t.text    :browser_session
      t.integer :session

      t.timestamps
    end
  end
end
