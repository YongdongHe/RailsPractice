class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	#调用add_index方法，参数含义为为user表的email列创建索引
  	#索引本身并不能保证唯一性，所以还要指定 unique: true
  	add_index :users , :email , :unique => true
  end
end
