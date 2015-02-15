class Object
	def self.const_missing(c)
		classname = c.to_s
		filename = Rulers.to_underscore(classname) + ".rb"
		raise "Can't load #{classname}, couldn't find file #{filename}" unless Rulers.file_in_load_path?(filename)

		require filename
		raise "Cannot find class #{classname}" unless Object.const_defined?(classname)

		klass = Object.const_get(c)
		klass
	end
end
