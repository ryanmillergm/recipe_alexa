class CreateBrowsers < ActiveRecord::Migration[5.2]
  def change
    create_table :browsers do |t|
      t.text    :browser_session
      t.string :session

      t.timestamps
    end
  end
end
