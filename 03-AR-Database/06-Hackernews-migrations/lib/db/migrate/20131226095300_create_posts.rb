class CreatePosts < ActiveRecord::Migration
  def up
  create_table :posts do |t|
  * name:string
  * source_url:string
  * date:datetime
  * rating:integer
  end
end