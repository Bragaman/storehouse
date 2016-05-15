class Product < ActiveRecord::Base
  belongs_to :client
  belongs_to :stack

  validate :validator

  def validator()
  	@stack = stack
  	@room = @stack.room
  	@client = client
  	temperature_validator
  	humidity_validator
  	place_validator
  	if !@stack.products.empty?
  		if @stack.products.first.client.entity_name != @client.entity_name
  			errors[:client] << "Cannot add anothers clients product on this stack"
  		end
  		total_load = 0
  		have_item_on_place = false
  		have_number_agreement =false
  		@stack.products.all.each do |i| 
  			total_load += i.weight
  			have_item_on_place = true if i.position == position
  			have_number_agreement = true if i.agreement_number == agreement_number
   		end

  		if (total_load +  weight) >= @stack.max_total_load
  			errors["Common errors"] << "total load is #{total_load}; max total load = #{@stack.max_total_load}"	
  		end

  		if have_item_on_place 
  			errors["Common errors"] << "in this stack on this position product exist"
  		end

  		if have_number_agreement
  			errors["Common errors"] << "number of agreement should be unique"
  		end
  	end
  end

	def temperature_validator()
		if @room.temperature_max > temperature_max 
			errors[:temperature_max] << "temperature = #{@room.temperature_max} is to big in this room for this product"
		end
		if @room.temperature_min < temperature_min 
			errors[:temperature_min] << "temperature = #{@room.temperature_min} is to low in this room for this product"
		end
	end

	def humidity_validator
		if @room.wet_max > humidity_max
			errors[:humidity_max] << "humidity = #{@room.wet_max} is to big in this room for this product"
		end
		if @room.wet_min < humidity_min
			errors[:humidity_min] << "humidity = #{@room.wet_min} is to low in this room for this product"
		end
	end

	def place_validator 
		if @stack.place_width < width 
			errors[:width] << "width = #{@stack.place_width} is to big in this stack for this product"
		end
		if @stack.place_height < height 
			errors[:height] << "height = #{@stack.place_height} is to big in this stack for this product"
		end
		if @stack.place_length < length 
			errors[:length] << "length = #{@stack.place_length} is to big in this stack for this product"
		end
		if @stack.products.size == @stack.place_count
			errors["Common errors:"] << "No empty place on this stack"
		end
	end

end
