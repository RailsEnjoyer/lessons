# Class DynamicAttributes: Dynamically creates getter, setter, and updater methods
# for each attribute provided during initialization.
class DynamicAttributes
  # Class variable to keep track of the number of instances created.
  @@instances = 0

  # Initialize with an array of attribute symbols.
  def initialize(attributes)
    # Increment the instance counter each time a new object is created.
    @@instances += 1

    # Iterate over each attribute to define methods dynamically.
    attributes.each do |att|
      # Define a setter method "set_<attribute>" that sets the instance variable.
      self.class.define_method("set_#{att}") do |param|
        instance_variable_set("@#{att}", param)
      end
      
      # Define an updater method "update_<attribute>" that updates the instance variable.
      self.class.define_method("update_#{att}") do |param|
        instance_variable_set("@#{att}", param)
      end
      
      # Define a getter method "<attribute>" that retrieves the instance variable's value.
      self.class.define_method(att) do
        instance_variable_get("@#{att}")
      end
    end
  end

  # Class method to return the total number of DynamicAttributes instances created.
  def self.instances
    @@instances
  end

  # Override method_missing to catch calls to undefined methods.
  # If the method name starts with "set_" or "update_", return a custom message.
  # Otherwise, indicate that the method is not described for this object.
  def method_missing(method, *args, &block)
    if method.to_s.start_with?("set_") || method.to_s.start_with?("update_")
      'finded with method missing'
    else
      "Method #{method} is not described for this object"
    end
  end

  # Override respond_to_missing? to accurately reflect available dynamic methods.
  def respond_to_missing?(method, include_private = false)
    method.to_s.start_with?("set_") || method.to_s.start_with?("update_") || super
  end  
end

# Create an instance of DynamicAttributes with attributes :name, :age, and :email.
person1 = DynamicAttributes.new([:name, :age, :email])
# Set the attributes using the dynamically defined setter methods.
person1.set_name("Ilya")
person1.set_age(23)
person1.set_email("ilia_ismailau.com")

# Retrieve and print attribute values using the dynamically defined getter methods.
puts "Person's1 name: #{person1.name}"
puts "Person's1 age: #{person1.age}"
puts "Person's1 email: #{person1.email}"

# Update the age attribute using the dynamically defined updater method.
person1.update_age(25)
puts "Person's1 age: #{person1.age}"

# Define a singleton method for person1, which is only available for this specific object.
def person1.say_method
  "This is singletone method of object: #{@name}"
end

# Call the singleton method for person1.
puts person1.say_method

# Output the total number of DynamicAttributes instances created.
puts "Total created instances: #{DynamicAttributes.instances}"

# Create another instance of DynamicAttributes for person2.
person2 = DynamicAttributes.new([:name, :age, :email])
# Set the attributes for person2 using the dynamically defined setter methods.
person2.set_name("Bogdan")
person2.set_age(22)
person2.set_email("r3ka1to@gmail.com")

# Retrieve and print attribute values for person2.
puts "Person's2 name: #{person2.name}"
puts "Person's2 age: #{person2.age}"
puts "Person's2 email: #{person2.email}"

# Output the updated total number of instances.
puts "Total created instances: #{DynamicAttributes.instances}"

# Define a singleton method for person2 that returns a formatted table of the object's attributes.
def person2.table
  "
  =========================================
                    #{@name}                
  Age:                                   #{@age} 
  Contact Email:                         #{@email}      
  =========================================
  "
end

# Call the singleton method for person2.
puts person2.table
