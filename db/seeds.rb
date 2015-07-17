GearType.all.each do |gear|
	GearType.destroy(gear)
end

{
	"文本" => 'text',
 	"Email" => 'email',
 	"长文本" => 'textarea',
 	"文件" => 'file',
 	"数字" => 'number',
 	"列表选择" => 'select',
 	"手机号" => 'number',
 	"radio选择" => 'radio',
 	"是否" => 'checkbox'
}.each_with_index do |type|
	puts "#{type[0]} - #{type[1]}"
	GearType.find_or_create_by({ :name => type[0], :type_value => type[1] })
end

ActiveRecord::Base.connection.execute(IO.read("#{Rails.root}/db/task.sql"))
